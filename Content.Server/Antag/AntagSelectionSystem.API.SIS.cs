using JetBrains.Annotations;
using Robust.Shared.Audio;
using Robust.Shared.Player;
using Content.SIS.Common.ChatBriefing;

namespace Content.Server.Antag;

public sealed partial class AntagSelectionSystem
{
    /// <summary>
    /// Helper method to send a formatted briefing entry to a list of sessions
    /// </summary>
    /// <param name="sessions">The sessions that will be sent the briefing</param>
    /// <param name="entry">The formatted briefing entry</param>
    [PublicAPI]
    public void SendBriefing(List<ICommonSession> sessions, GreetingEntry? entry)
    {
        if (entry == null)
            return;

        foreach (var session in sessions)
        {
            SendBriefing(session, entry, entry.Sound);
        }
    }

    /// <summary>
    /// Helper method to send a formatted GreetingEntry to an entity
    /// </summary>
    [PublicAPI]
    public void SendBriefing(EntityUid entity, GreetingEntry? entry, SoundSpecifier? briefingSound = null)
    {
        if (!_mind.TryGetMind(entity, out _, out var mindComponent))
            return;

        if (!_playerManager.TryGetSessionById(mindComponent.UserId, out var session))
            return;

        SendBriefing(session, entry, briefingSound);
    }

    /// <summary>
    /// Helper method to send a formatted ChatBriefingEntry to a session
    /// </summary>
    /// <param name="session">The player chosen to be an antag</param>
    /// <param name="entry">The ChatBriefingEntry containing sections</param>
    /// <param name="sound">Optional sound to play</param>
    [PublicAPI]
    public void SendBriefing(ICommonSession? session, GreetingEntry? entry, SoundSpecifier? sound = null)
    {
        if (session == null || entry == null)
            return;

        var markupText = _chatBriefing.BuildSections(entry);
        if (string.IsNullOrEmpty(markupText))
            return;

        SendBriefing(session, markupText, null, sound);
    }
}
