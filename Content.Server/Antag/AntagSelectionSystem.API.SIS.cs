using JetBrains.Annotations;
using Robust.Shared.Audio;
using Robust.Shared.Player;
using Content.SIS.Common.ChatBriefing;

namespace Content.Server.Antag;

public sealed partial class AntagSelectionSystem
{
    /// <summary>
    /// Helper method to send a formatted GreetingEntry to an entity
    /// </summary>
    [PublicAPI]
    public void SendBriefing(EntityUid entity, GreetingEntry? entry, SoundSpecifier? sound = null)
    {
        if (!_mind.TryGetMind(entity, out _, out var mindComponent))
            return;

        if (!_playerManager.TryGetSessionById(mindComponent.UserId, out var session))
            return;

        sound ??= entry?.Sound;
        SendBriefing(session, entry, sound);
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

        sound ??= entry.Sound;
        SendBriefing(session, markupText, null, sound);
    }
}
