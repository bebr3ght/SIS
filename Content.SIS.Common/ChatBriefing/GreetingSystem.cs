using System.Linq;

namespace Content.SIS.Common.ChatBriefing;

public sealed class GreetingSystem : EntitySystem
{
    private static readonly Color ColorFallback = Color.White;
    private static readonly Color BackgroundColorFallback = Color.Black;

    public GreetingEntry CreateGreetingEntry(string localePrefix, GreetingTheme? theme, params (string, object)[]? args)
    {
        var resolvedTheme = theme ?? new GreetingTheme();

        var titleHl1 = resolvedTheme.TitleHighlightFirstColor ?? ColorFallback;
        var titleHl2 = resolvedTheme.TitleHighlightSecondColor ?? titleHl1;

        var messageHl1 = resolvedTheme.MessageHighlightFirstColor ?? ColorFallback;
        var messageHl2 = resolvedTheme.MessageHighlightSecondColor ?? messageHl1;

        var greetingTitle = Loc.GetString($"{localePrefix}role-greeting", [.. args ?? [], ("hl1", messageHl1), ("hl2", messageHl2)]);
        var greetingDesc = Loc.GetString($"{localePrefix}role-greeting-desc", ("hl1", messageHl1), ("hl2", messageHl2));

        var entry = new GreetingEntry { Theme = resolvedTheme };
        entry.AddSection(Loc.GetString("role-greeting-title", ("hl1", titleHl1), ("hl2", titleHl2)), greetingTitle, 0);
        entry.AddSection(Loc.GetString("role-greeting-desc", ("hl1", titleHl1), ("hl2", titleHl2)), greetingDesc, 1);

        return entry;
    }

    /// <summary>
    /// Builds a formatted markup string from a ChatBriefingEntry using TitleBoxes and MessageBoxes.
    /// </summary>
    public string? BuildSections(GreetingEntry? entry)
    {
        if (entry == null || entry.Sections.Count == 0)
            return null;

        var theme = entry.Theme;
        var sections = entry.Sections.OrderBy(s => s.Priority).ToList();

        var finalMessage = new FormattedMessage();
        finalMessage.PushNewline();

        foreach (var section in sections)
        {
            AppendTitleBox(finalMessage, theme, section);
            AppendMessageBox(finalMessage, theme, section);
            PushNewlines(finalMessage, 3);
        }

        finalMessage.TrimEnd();
        finalMessage.PushNewline();
        return finalMessage.ToMarkup();
    }

    private void AppendTitleBox(FormattedMessage message, GreetingTheme? theme, GreetingSection section)
    {
        if (string.IsNullOrEmpty(section.Title))
            return;

        var textColor = theme?.TitleTextColor ?? ColorFallback;
        var hl1 = theme?.TitleHighlightFirstColor ?? textColor;
        var hl2 = theme?.TitleHighlightSecondColor ?? hl1;
        var bgColor = theme?.TitleBgColor ?? BackgroundColorFallback;
        var borderColor = theme?.TitleBorderColor ?? textColor;

        var text = Loc.GetString(section.Title, ("hl1", hl1.ToHex()), ("hl2", hl2.ToHex()));

        message.AddMarkupPermissive(BuildBoxMarkup("titlebox", textColor, bgColor, borderColor, text));
        PushNewlines(message, 2);
    }

    private void AppendMessageBox(FormattedMessage message, GreetingTheme? theme, GreetingSection section)
    {
        if (string.IsNullOrEmpty(section.Message))
            return;

        var textColor = theme?.MessageTextColor ?? ColorFallback;
        var hl1 = theme?.MessageHighlightFirstColor ?? textColor;
        var hl2 = theme?.MessageHighlightSecondColor ?? hl1;
        var bgColor = theme?.MessageBgColor ?? BackgroundColorFallback;
        var borderColor = theme?.MessageBorderColor ?? textColor;

        var text = Loc.GetString(section.Message, ("hl1", hl1.ToHex()), ("hl2", hl2.ToHex()));

        message.AddMarkupPermissive(BuildBoxMarkup("messagebox", textColor, bgColor, borderColor, text));
    }

    private string BuildBoxMarkup(string tag, Color textColor, Color bgColor, Color borderColor, string text)
    {
        return $"[{tag} bg=\"{bgColor.ToHex()}\" border=\"{borderColor.ToHex()}\"]"
               + $"[color={textColor.ToHex()}]{text}[/color][/{tag}]";
    }

    private void PushNewlines(FormattedMessage message, int count)
    {
        for (var i = 0; i < count; i++)
            message.PushNewline();
    }
}
