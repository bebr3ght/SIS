using System.Linq;
using Content.Server.Antag;
using Content.Server.GameTicking.Rules;
using Content.Shared.GameTicking.Components;
using Content.Shared.Station.Components;
using Content.SIS.Common.ChatBriefing;
using Robust.Shared.Random;

namespace Content.SIS.Server.Ninja.GameTicking.Rules;

public sealed partial class NinjaRuleSystem : GameRuleSystem<NinjaRuleComponent>
{
    [Dependency] private AntagSelectionSystem _antag = default!;
    [Dependency] private IRobustRandom _random = default!;
    [Dependency] private GreetingSystem _greeting = default!; // SIS-ChatGreeting

    public override void Initialize()
    {
        base.Initialize();

        SubscribeLocalEvent<NinjaRuleComponent, AfterAntagEntitySelectedEvent>(OnSelectAntag);
    }
    private void OnSelectAntag(Entity<NinjaRuleComponent> ent, ref AfterAntagEntitySelectedEvent args)
    {
        var theme = args.Def.Briefing?.Theme ?? new GreetingTheme();

        var station = ent.Comp.TargetStation != null ? Name(ent.Comp.TargetStation.Value) : "the station";

        var hl1 = theme.MessageHighlightFirstColor ?? theme.HighlightFirstColor ?? theme.HighlightColor ?? Color.Orange;
        var hl2 = theme.MessageHighlightSecondColor ?? theme.HighlightSecondColor ?? hl1;

        var greetingText = Loc.GetString("ninja-role-greeting", ("station", station), ("hl1", hl1), ("hl2", hl2));
        var greetingDesc = Loc.GetString("ninja-role-greeting-desc", ("hl1", hl1), ("hl2", hl2));

        var entry = _greeting.CreateGreetingEntry(greetingText, greetingDesc, theme);
        _antag.SendBriefing(args.EntityUid, entry);
    }

    protected override void Started(EntityUid uid,
        NinjaRuleComponent component,
        GameRuleComponent gameRule,
        GameRuleStartedEvent args)
    {
        var stations = GetTargetStations().ToList();
        if (stations.Count == 0)
            return;
        component.TargetStation = _random.Pick(stations);
    }

    private IEnumerable<Entity<StationDataComponent?>> GetTargetStations()
    {
        var query = EntityQueryEnumerator<StationNinjaTargetComponent, StationDataComponent>();
        while (query.MoveNext(out var station, out _, out var data))
        {
            yield return (station, data);
        }
    }
}
