// SPDX-License-Identifier: AGPL-3.0-or-later

using Content.Server.Antag;
using Content.Server.GameTicking.Rules;
using Content.Server.Revolutionary.Components;
using Content.Trauma.Shared.Revolutionary;
using Robust.Shared.Player;
using Content.Shared.Antag;
using Content.SIS.Common.ChatBriefing;

namespace Content.Trauma.Server.Revolutionary;

public sealed partial class RevConversionSystem : EntitySystem
{
    [Dependency] private AntagSelectionSystem _antag = default!;
    [Dependency] private RevolutionaryRuleSystem _rev = default!;
    // SIS-ChatGreeting Start
    [Dependency] private IPrototypeManager _proto = default!;
    [Dependency] private GreetingSystem _greeting = default!;
    // SIS-ChatGreeting End

    private static readonly ProtoId<AntagSpecifierPrototype> BriefingTheme = "HeadRev"; // SIS-ChatGreeting

    public override void Initialize()
    {
        base.Initialize();

        SubscribeLocalEvent<RevConvertedEvent>(OnRevConverted);
    }

    private void OnRevConverted(ref RevConvertedEvent args)
    {
        if (TryComp<ActorComponent>(args.Target, out var actor))
        {
            // SIS-ChatGreeting Start
            var proto = _proto.Index(BriefingTheme);
            var entry = _greeting.CreateGreetingEntry("rev-", proto.Briefing?.Theme);
            _antag.SendBriefing(actor.PlayerSession, entry, args.Target.Comp.RevStartSound);
            // SIS-ChatGreeting End
        }

        if (!TryComp<CommandStaffComponent>(args.Target, out var command))
            return;

        command.Enabled = false;
        _rev.CheckCommandLose();
    }
}
