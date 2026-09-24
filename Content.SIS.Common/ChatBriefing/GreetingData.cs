using Robust.Shared.Audio;

namespace Content.SIS.Common.ChatBriefing;

[DataDefinition]
public partial struct GreetingSection
{
    [DataField(required: true)]
    public GreetingBox? Title;

    [DataField(required: true)]
    public GreetingBox? Message;

    [DataField]
    public int Priority = 0;

    [DataField]
    public Color? TextColor;

    #region Highlight

    [DataField("highlight")]
    public Color? HighlightColor;

    [DataField("highlight1")]
    public Color? HighlightFirstColor;

    [DataField("highlight2")]
    public Color? HighlightSecondColor;

    #endregion

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

[DataDefinition]
public sealed partial class GreetingBox
{
    [DataField(required: true)]
    public string Text;

    [DataField]
    public Color? BackgroundColor;

    [DataField]
    public Color? BorderColor;

    [DataField]
    public Color? TextColor;

    #region Highlight

    [DataField("highlight")]
    public Color? HighlightColor;

    [DataField("highlight1")]
    public Color? HighlightFirstColor;

    [DataField("highlight2")]
    public Color? HighlightSecondColor;

    #endregion
}

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
            Title = new GreetingBox { Text = titleText },
            Message = new GreetingBox { Text = messageText },
            Priority = priority,
        });
    }
}

[DataDefinition]
public partial record struct GreetingTheme
{
    [DataField("titleBackground")]
    public Color? TitleBgColor;

    [DataField("titleBorder")]
    public Color? TitleBorderColor;

    [DataField("messageBackground")]
    public Color? MessageBgColor;

    [DataField("messageBorder")]
    public Color? MessageBorderColor;

    [DataField("text")]
    public Color? TextColor;

    [DataField("titleText")]
    public Color? TitleTextColor;

    [DataField("messageText")]
    public Color? MessageTextColor;

    #region Highlight

    [DataField("highlight")]
    public Color? HighlightColor;

    [DataField("highlight1")]
    public Color? HighlightFirstColor;

    [DataField("highlight2")]
    public Color? HighlightSecondColor;

    #endregion

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
