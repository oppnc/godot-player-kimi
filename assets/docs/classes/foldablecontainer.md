# FoldableContainer

> class FoldableContainer ; keywords=expandable, collapsible, collapse, accordion, details
> inherits FoldableContainer Container

## Brief

A container that can be expanded/collapsed.

## Description

A container that can be expanded/collapsed, with a title that can be filled with controls, such as buttons. This is also called an accordion.
The title can be positioned at the top or bottom of the container. The container can be expanded or collapsed by clicking the title or by pressing `ui_accept` when focused. Child control nodes are hidden when the container is collapsed. Ignores non-control children.
A FoldableContainer can be grouped with other FoldableContainers so that only one of them can be opened at a time; see `foldable_group` and `FoldableGroup`.

## Properties

> property focus_mode : Control.FocusMode ; default=2 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property foldable_group : FoldableGroup ; setter=set_foldable_group ; getter=get_foldable_group

The `FoldableGroup` associated with the container. When multiple `FoldableContainer` nodes share the same group, only one of them is allowed to be unfolded.

> property folded : bool ; default=false ; setter=set_folded ; getter=is_folded

If `true`, the container will become folded and will hide all its children.

> property language : String ; default="" ; setter=set_language ; getter=get_language

Language code used for text shaping algorithms. If left empty, the current locale is used instead.

> property mouse_filter : Control.MouseFilter ; default=0 ; setter=set_mouse_filter ; getter=get_mouse_filter ; overrides=Control

> property title : String ; default="" ; setter=set_title ; getter=get_title

The container's title text.

> property title_alignment : HorizontalAlignment ; default=0 ; setter=set_title_alignment ; getter=get_title_alignment

Title's horizontal text alignment.

> property title_position : TitlePosition ; default=0 ; setter=set_title_position ; getter=get_title_position

Title's position.

> property title_text_direction : Control.TextDirection ; default=0 ; setter=set_title_text_direction ; getter=get_title_text_direction

Title text writing direction.

> property title_text_overrun_behavior : TextServer.OverrunBehavior ; default=0 ; setter=set_title_text_overrun_behavior ; getter=get_title_text_overrun_behavior

Defines the behavior of the title when the text is longer than the available space.

## Methods

> method add_title_bar_control(control: Control) -> void

Adds a `Control` that will be placed next to the container's title, obscuring the clickable area. Prime usage is adding `Button` nodes, but it can be any `Control`.
The control will be added as a child of this container and removed from previous parent if necessary. The controls will be placed aligned to the right, with the first added control being the leftmost one.

> method expand() -> void

Expands the container and emits `folding_changed`.

> method fold() -> void

Folds the container and emits `folding_changed`.

> method remove_title_bar_control(control: Control) -> void

Removes a `Control` added with `add_title_bar_control`. The node is not freed automatically, you need to use `Node.queue_free`.

## Signals

> signal folding_changed(is_folded: bool)

Emitted when the container is folded/expanded.

## Enumerations

> enum TitlePosition

> enum_value TitlePosition.POSITION_TOP = 0

Makes the title appear at the top of the container.

> enum_value TitlePosition.POSITION_BOTTOM = 1

Makes the title appear at the bottom of the container. Also makes all StyleBoxes flipped vertically.

## Theme Properties

> theme_property collapsed_font_color : Color ; data=color ; default=Color(1, 1, 1, 1)

The title's font color when collapsed.

> theme_property font_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

The title's font color when expanded.

> theme_property font_outline_color : Color ; data=color ; default=Color(1, 1, 1, 1)

The title's font outline color.

> theme_property hover_font_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

The title's font hover color.

> theme_property h_separation : int ; data=constant ; default=2

The horizontal separation between the title's icon and text, and between title bar controls.

> theme_property outline_size : int ; data=constant ; default=0

The title's font outline size.

> theme_property font : Font ; data=font

The title's font.

> theme_property font_size : int ; data=font_size

The title's font size.

> theme_property expanded_arrow : Texture2D ; data=icon

The title's icon used when expanded.

> theme_property expanded_arrow_mirrored : Texture2D ; data=icon

The title's icon used when expanded (for bottom title).

> theme_property folded_arrow : Texture2D ; data=icon

The title's icon used when folded (for left-to-right layouts).

> theme_property folded_arrow_mirrored : Texture2D ; data=icon

The title's icon used when collapsed (for right-to-left layouts).

> theme_property focus : StyleBox ; data=style

Background used when `FoldableContainer` has GUI focus. The `focus` `StyleBox` is displayed *over* the base `StyleBox`, so a partially transparent `StyleBox` should be used to ensure the base `StyleBox` remains visible. A `StyleBox` that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a `StyleBoxEmpty` resource. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.

> theme_property panel : StyleBox ; data=style

Default background for the `FoldableContainer`.

> theme_property title_collapsed_hover_panel : StyleBox ; data=style

Background used when the mouse cursor enters the title's area when collapsed.

> theme_property title_collapsed_panel : StyleBox ; data=style

Default background for the `FoldableContainer`'s title when collapsed.

> theme_property title_hover_panel : StyleBox ; data=style

Background used when the mouse cursor enters the title's area when expanded.

> theme_property title_panel : StyleBox ; data=style

Default background for the `FoldableContainer`'s title when expanded.
