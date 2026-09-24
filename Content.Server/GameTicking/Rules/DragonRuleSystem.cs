using Content.Server.Antag;
using Content.Server.GameTicking.Rules.Components;
using Content.Server.Mind;
using Content.Server.Roles;
using Content.Server.Station.Systems;
using Content.Shared.Localizations;
using Content.Shared.Roles.Components;
using Robust.Server.GameObjects;
using Content.Shared.Antag;
using Content.SIS.Common.ChatBriefing;

namespace Content.Server.GameTicking.Rules;

public sealed partial class DragonRuleSystem : GameRuleSystem<DragonRuleComponent>
{
    [Dependency] private TransformSystem _transform = default!;
    [Dependency] private AntagSelectionSystem _antag = default!;
    [Dependency] private StationSystem _station = default!;
    [Dependency] private RoleSystem _roleSystem = default!;
    [Dependency] private MindSystem _mind = default!;
    [Dependency] private GreetingSystem _greeting = default!; // SIS-ChatGreeting

    public override void Initialize()
    {
        base.Initialize();

        SubscribeLocalEvent<DragonRuleComponent, AfterAntagEntitySelectedEvent>(AfterAntagEntitySelected);
        SubscribeLocalEvent<DragonRoleComponent, GetBriefingEvent>(UpdateBriefing);
    }

    private void UpdateBriefing(Entity<DragonRoleComponent> entity, ref GetBriefingEvent args)
    {
        var ent = args.Mind.Comp.OwnedEntity;

        if(ent is null)
            return;

        // SIS-ChatGreeting Start
        var direction = GetDirectionToStation(ent.Value);
        args.Append(Loc.GetString("dragon-role-briefing", ("direction", direction)));
        // SIS-ChatGreeting End
    }

    private void AfterAntagEntitySelected(Entity<DragonRuleComponent> ent, ref AfterAntagEntitySelectedEvent args)
    {
        if (!_mind.TryGetMind(args.EntityUid, out var mindId, out var mind))
            return;

        _roleSystem.MindHasRole<DragonRoleComponent>(mindId, out var dragonRole);

        if(dragonRole is null)
            return;

        _antag.SendBriefing(args.EntityUid, MakeGreeting(args.EntityUid, args.Def)); // SIS-ChatGreeting
    }

    // SIS-ChatGreeting Start
    private GreetingEntry MakeGreeting(EntityUid dragon, AntagSpecifierPrototype proto)
    {
        var direction = GetDirectionToStation(dragon);
        return _greeting.CreateGreetingEntry("dragon-", proto.Briefing?.Theme, ("direction", direction));
    }

    private string GetDirectionToStation(EntityUid dragon)
    {
        var dragonXform = Transform(dragon);

        EntityUid? stationGrid = null;
        if (_station.GetStationInMap(dragonXform.MapID) is { } station)
            stationGrid = _station.GetLargestGrid(station);

        if (stationGrid is not null)
        {
            var stationPosition = _transform.GetWorldPosition(stationGrid.Value);
            var dragonPosition = _transform.GetWorldPosition(dragon);

            var vectorToStation = stationPosition - dragonPosition;
            return ContentLocalizationManager.FormatDirection(vectorToStation.GetDir());
        }

        return Loc.GetString("generic-unknown-title");
    }
    // SIS-ChatGreeting End
}
