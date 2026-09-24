// SPDX-License-Identifier: AGPL-3.0-or-later

using Content.Goobstation.Common.Blob;
using Content.Server.Administration.Systems;
using Content.Shared.Database;
using Content.Shared.Verbs;
using Content.Trauma.Common.Silicon;
using Robust.Shared.Player;
using Content.Server.Antag;
using Content.Shared.Mind.Components;
using Content.Goobstation.Server.Blob.GameTicking;

namespace Content.Goobstation.Server.Administration.Systems;

public sealed partial class GoobAdminVerbSystem
{
    [Dependency] private CommonSiliconSystem _silicon = default!;
    [Dependency] private AntagSelectionSystem _antag = default!; // SIS-TODO: Портануть фикс Блоба Травме

    private static readonly EntProtoId BlobRule = "BlobGameMode"; // SIS-TODO: Портануть фикс Блоба Травме

    private void OnGetAntagVerbs(ref GetAntagVerbsEvent args)
    {
        var target = args.Target;
        if (_silicon.IsSilicon(target))
            return;

        // SIS-TODO: Портануть фикс Блоба Травме Start
        if (!HasComp<MindContainerComponent>(target) || !TryComp<ActorComponent>(target, out var targetActor))
            return;

        var targetPlayer = targetActor.PlayerSession;
        // SIS-TODO: Портануть фикс Блоба Травме End

        // Blob
        args.Verbs.Verbs.Add(new()
        {
            Text = Loc.GetString("admin-verb-text-make-blob"),
            Category = VerbCategory.Antag,
            Icon = new SpriteSpecifier.Rsi(new("_Goobstation/Blob/Actions/blob.rsi"), "blobFactory"),
            Act = () =>
            {
                _antag.ForceMakeAntag<BlobRuleComponent>(targetPlayer, BlobRule); // SIS-TODO: Портануть фикс Блоба Травме
                EnsureComp<BlobCarrierComponent>(target).HasMind = HasComp<ActorComponent>(target);
            },
            Impact = LogImpact.High,
            Message = Loc.GetString("admin-verb-text-make-blob"),
        });
    }
}
