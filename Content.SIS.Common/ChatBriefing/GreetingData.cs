using Robust.Shared.Audio;

namespace Content.SIS.Common.ChatBriefing;

[DataDefinition]
public sealed partial class GreetingEntry
{
    [DataField]
    public List<GreetingSection> Sections { get; private set; } = new();

    [DataField]
    public GreetingTheme? Theme;

    [DataField]
    public SoundSpecifier? Sound;

    public void AddSection(string titleText, string messageText, int priority)
    {
        Sections.Add(new GreetingSection
        {
            Title = titleText,
            Message = messageText,
            Priority = priority,
        });
    }
}

[DataDefinition]
public partial record struct GreetingSection
{
    [DataField(required: true)]
    public string? Title;

    [DataField(required: true)]
    public string? Message;

    [DataField]
    public int Priority = 0;
}

[DataDefinition]
public partial record struct GreetingTheme
{
    [DataField("titleText")]
    public Color? TitleTextColor;

    [DataField("messageText")]
    public Color? MessageTextColor;

    [DataField("titleBackground")]
    public Color? TitleBgColor;

    [DataField("messageBackground")]
    public Color? MessageBgColor;

    [DataField("titleBorder")]
    public Color? TitleBorderColor;

    [DataField("messageBorder")]
    public Color? MessageBorderColor;

    #region TitleHighlight

    [DataField("titleHighlight1")]
    public Color? TitleHighlightFirstColor;

    [DataField("titleHighlight2")]
    public Color? TitleHighlightSecondColor;

    #endregion

    #region MessageHighlight

    [DataField("messageHighlight1")]
    public Color? MessageHighlightFirstColor;

    [DataField("messageHighlight2")]
    public Color? MessageHighlightSecondColor;

    #endregion
}
