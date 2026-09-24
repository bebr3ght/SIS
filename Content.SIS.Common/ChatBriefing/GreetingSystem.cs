using System.Linq;

namespace Content.SIS.Common.ChatBriefing;

public sealed class GreetingSystem : EntitySystem
{
    private const string TitleBgColorFallback = "#a42f2f";
    private const string TitleBorderColorFallback = "#ff0000";
    private const string MessageBgColorFallback = "#221919";
    private const string MessageBorderColorFallback = "#3b1111";
    private static readonly Color ColorFallback = Color.Orange;

    public GreetingEntry CreateGreetingEntry(string localePrefix,
        GreetingTheme? theme,
        params (string, object)[]? args)
    {
        var resolvedTheme = theme ?? new GreetingTheme();

        var hl1 = resolvedTheme.MessageHighlightFirstColor
                  ?? resolvedTheme.HighlightFirstColor
                  ?? resolvedTheme.HighlightColor
                  ?? ColorFallback;

        var hl2 = resolvedTheme.MessageHighlightSecondColor
                  ?? resolvedTheme.HighlightSecondColor
                  ?? hl1;

        var greetingTitle = Loc.GetString($"{localePrefix}role-greeting", [.. args ?? [], ("hl1", hl1), ("hl2", hl2)]);
        var greetingDesc = Loc.GetString($"{localePrefix}role-desc", ("hl1", hl1), ("hl2", hl2));

        var entry = new GreetingEntry { Theme = resolvedTheme };
        entry.AddSection(Loc.GetString("role-greeting-title"), greetingTitle, 0);
        entry.AddSection(Loc.GetString("role-greeting-desc-title"), greetingDesc, 1);

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

        var sections = new List<GreetingSection>(entry.Sections);
        sections.Sort((a, b) => a.Priority.CompareTo(b.Priority));

        var finalMessage = new FormattedMessage();
        finalMessage.PushNewline();

        for (var i = 0; i < sections.Count; i++)
        {
            var section = sections[i];

            if (section.Title != null && !string.IsNullOrEmpty(section.Title.Text))
            {
                var bgColor = section.Title.BackgroundColor?.ToHex()
                              ?? theme?.TitleBgColor?.ToHex()
                              ?? TitleBgColorFallback;

                var borderColor = section.Title.BorderColor?.ToHex()
                                  ?? theme?.TitleBorderColor?.ToHex()
                                  ?? TitleBorderColorFallback;

                var color = section.Title.TextColor
                            ?? section.TextColor
                            ?? theme?.TitleTextColor
                            ?? theme?.TextColor
                            ?? ColorFallback;

                var hl1 = section.Title.HighlightFirstColor
                          ?? section.TitleHighlightFirstColor
                          ?? section.HighlightFirstColor
                          ?? theme?.TitleHighlightFirstColor
                          ?? theme?.HighlightFirstColor
                          ?? theme?.HighlightColor
                          ?? color;

                var hl2 = section.Title.HighlightSecondColor
                          ?? section.TitleHighlightSecondColor
                          ?? section.HighlightSecondColor
                          ?? theme?.TitleHighlightSecondColor
                          ?? theme?.HighlightSecondColor
                          ?? hl1;

                var text = Loc.GetString(section.Title.Text, ("hl1", hl1.ToHex()), ("hl2", hl2.ToHex()));
                var markup = $"[titlebox bg=\"{bgColor}\" border=\"{borderColor}\"][color={color.ToHex()}]{text}[/color][/titlebox]";
                finalMessage.AddMarkupPermissive(markup);

                finalMessage.PushNewline();
                finalMessage.PushNewline();
            }

            if (section.Message != null && !string.IsNullOrEmpty(section.Message.Text))
            {
                var bgColor = section.Message.BackgroundColor?.ToHex()
                              ?? theme?.MessageBgColor?.ToHex()
                              ?? MessageBgColorFallback;

                var borderColor = section.Message.BorderColor?.ToHex()
                                  ?? theme?.MessageBorderColor?.ToHex()
                                  ?? MessageBorderColorFallback;

                var color = section.Message.TextColor
                            ?? section.TextColor
                            ?? theme?.MessageTextColor
                            ?? theme?.TextColor
                            ?? ColorFallback;

                var hl1 = section.Message.HighlightFirstColor
                          ?? section.MessageHighlightFirstColor
                          ?? section.HighlightFirstColor
                          ?? theme?.MessageHighlightFirstColor
                          ?? theme?.HighlightFirstColor
                          ?? theme?.HighlightColor
                          ?? color;

                var hl2 = section.Message.HighlightSecondColor
                          ?? section.MessageHighlightSecondColor
                          ?? section.HighlightSecondColor
                          ?? theme?.MessageHighlightSecondColor
                          ?? theme?.HighlightSecondColor
                          ?? hl1;

                var text = Loc.GetString(section.Message.Text, ("hl1", hl1.ToHex()), ("hl2", hl2.ToHex()));

                var markup = $"[messagebox bg=\"{bgColor}\" border=\"{borderColor}\"][color={color.ToHex()}]{text}[/color][/messagebox]";
                finalMessage.AddMarkupPermissive(markup);
            }

            if (i < sections.Count - 1)
            {
                finalMessage.PushNewline();
                finalMessage.PushNewline();
                finalMessage.PushNewline();
            }
        }
        finalMessage.PushNewline();
        // finalMessage.Pop();

        return finalMessage.ToMarkup();
    }
}
