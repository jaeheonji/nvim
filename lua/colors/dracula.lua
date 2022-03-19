local lush = require("lush")

-- Dracula Theme:
-- https://github.com/dracula/vim/blob/master/colors/dracula.vim
return lush(function()
    return {
        -- Highlight Groups:
        DraculaBgLighter { bg = "#424450" },
        DraculaBgLight { bg = "#343746" },
        DraculaBg { bg = "#282A36" },
        DraculaBgDark { bg = "#21222C" },
        DraculaBgDarker { bg = "#191A21" },

        DraculaFg { fg = "#F8F8F2" },
        DraculaFgUnderline { fg = "#F8F8F2", gui = "underline" },
        DraculaFgBold { fg = "#F8F8F2", gui = "bold" },

        DraculaComment { fg = "#6272A4" },
        DraculaCommentBold { fg = "#6272A4", gui = "bold" },

        DraculaSelection { bg = "#44475A" },
        DraculaSubtle { fg = "#424450" },

        DraculaCyan { fg = "#8BE9FD" },
        DraculaCyanItalic { fg = "#8BE9FD", gui = "italic" },

        DraculaGreen { fg = "#50FA7B" },
        DraculaGreenBold { fg = "#50FA7B", gui = "bold" },
        DraculaGreenItalic { fg = "#50FA7B", gui = "italic" },
        DraculaGreenItalicUnderline { fg = "#50FA7B", gui = "italic,underline" },

        DraculaOrange { fg = "#FFB86C" },
        DraculaOrangeBold { fg = "#FFB86C", gui = "bold" },
        DraculaOrangeItalic { fg = "#FFB86C", gui = "italic" },
        DraculaOrangeBoldItalic { fg = "#FFB86C", gui = "bold,italic" },
        DraculaOrangeInverse { fg = DraculaBg.bg, bg = "#FFB86C" },

        DraculaPink { fg = "#FF79C6" },
        DraculaPinkItalic { fg = "#FF79C6", gui = "italic" },

        DraculaPurple { fg = "#BD93F9" },
        DraculaPurpleBold { fg = "#BD93F9", gui = "bold" },
        DraculaPurpleItalic { fg = "#BD93F9", gui = "italic" },

        DraculaRed { fg = "#FF5555" },
        DraculaRedInverse { fg = DraculaFg.fg, bg = "#FF5555" },

        DraculaYellow { fg = "#F1FA8C" },
        DraculaYellowItalic { fg = "#F1FA8C", gui = "italic" },

        DraculaError { fg = DraculaRed.fg, sp = DraculaRed.fg },

        DraculaErrorLine { fg = DraculaRed.fg, sp = DraculaRed.fg, gui = "undercurl" },
        DraculaWarnLine { fg = DraculaOrange.fg, sp = DraculaOrange.fg, gui = "undercurl" },
        DraculaInfoLine { fg = DraculaCyan.fg, sp = DraculaCyan.fg, gui = "undercurl" },

        DraculaTodo { fg = DraculaCyan.fg, gui = "bold,inverse" },
        DraculaSearch { fg = DraculaGreen.fg, gui = "inverse" },
        DraculaBoundary { fg = DraculaComment.fg, bg = DraculaBgDarker.bg },
        DraculaLink { fg = DraculaCyan.fg, gui = "underline" },

        DraculaDiffChange { fg = DraculaOrange.fg },
        DraculaDiffText { fg = DraculaBg.bg, bg = DraculaOrange.fg },
        DraculaDiffDelete { fg = DraculaRed.fg, bg = DraculaBgDark.bg },

        -- Interface:
        Normal { fg = DraculaFg.fg, bg = DraculaBg.bg },

        StatusLine { bg = DraculaBgLighter.bg, gui = "bold" },
        StatusLineNc { bg = DraculaBgLight.bg },
        StatusLineTerm { bg = DraculaBgLighter.bg, gui = "bold" },
        StatusLineTermNc { bg = DraculaBgLight.bg },

        WildMenu { fg = DraculaBg.bg, bg = DraculaPurple.fg, gui = "bold" },
        CursorLine { bg = DraculaSubtle.fg },

        ColorColumn { DraculaBgDark },
        CursorColumn { CursorLine },
        CursorLineNr { DraculaYellow },

        DiffAdd { DraculaGreen },
        DiffAdded { DiffAdd },
        DiffChange { DraculaDiffChange },
        DiffDelete { DraculaDiffDelete },
        DiffRemoved { DiffDelete },
        DiffText { DraculaDiffText },

        Directory { DraculaPurpleBold },
        ErrorMsg { DraculaRedInverse },
        FoldColumn { DraculaSubtle },
        Folded { DraculaBoundary },
        IncSearch { DraculaOrangeInverse },

        LineNr { fg = DraculaComment.fg },
        MoreMsg { DraculaFgBold },
        NonText { DraculaSubtle },
        
        Pmenu { DraculaBgDark },
        PmenuSbar { DraculaBgDark },
        PmenuSel { DraculaSelection },
        PmenuThumb { DraculaSelection },

        Question { DraculaFgBold },
        Search { DraculaSearch },

        SignColumn { fg = DraculaComment.fg },

        TabLine { DraculaBoundary },
        TabLineFill { DraculaBgDark },
        TabLineSel { Normal },

        Title { DraculaGreenBold },
        VertSplit { DraculaBoundary },
        Visual { DraculaSelection },
        VisualNOS { Visual },
        WarningMsg { DraculaOrangeInverse },

        -- Syntax:
        MatchParen { fg = DraculaGreen.fg, gui = "underline" },
        Conceal { fg = DraculaCyan.fg },

        SpecialKey { DraculaRed },

        LspReferenceText { DraculaSelection },
        LspReferenceRead { DraculaSelection },
        LspReferenceWrite { DraculaSelection },

        DiagnosticInfo { DraculaCyan },
        DiagnosticHint { DraculaCyan },
        DiagnosticError { DraculaError },
        DiagnosticWarn { DraculaOrange },
        DiagnosticUnderlineError { DraculaErrorLine },
        DiagnosticUnderlineHint { DraculaInfoLine },
        DiagnosticUnderlineInfo { DraculaInfoLine },
        DiagnosticUnderlineWarn { DraculaWarnLine },

        LspDiagnosticsDefaultInformation { DiagnosticInfo },
        LspDiagnosticsDefaultHint { DiagnosticHint },
        LspDiagnosticsDefaultError { DiagnosticError },
        LspDiagnosticsDefaultWarning { DiagnosticWarn },
        LspDiagnosticsUnderlineError { DiagnosticUnderlineError },
        LspDiagnosticsUnderlineHint { DiagnosticUnderlineHint },
        LspDiagnosticsUnderlineInformation { DiagnosticUnderlineInfo },
        LspDiagnosticsUnderlineWarning { DiagnosticUnderlineWarn },

        Comment { DraculaComment },
        Underlined { DraculaFgUnderline },
        Todo { DraculaTodo },

        Error { DraculaError },
        SpellBad { DraculaErrorLine },
        SpellLocal { DraculaWarnLine },
        SpellCap { DraculaInfoLine },
        SpellRare { DraculaInfoLine },

        Constant { DraculaPurple },
        String { DraculaYellow },
        Character { DraculaPink },
        Number { Constant },
        Boolean { Constant },
        Float { Constant },

        Identifier { DraculaFg },
        Function { DraculaGreen },

        Statement { DraculaPink },
        Conditional { DraculaPink },
        Repeat { DraculaPink },
        Label { DraculaPink },
        Operator { DraculaPink },
        Keyword { DraculaPink },
        Exception { DraculaPink },

        PreProc { DraculaPink },
        Include { DraculaPink },
        Define { DraculaPink },
        Macro { DraculaPink },
        PreCondit { DraculaPink },
        StorageClass { DraculaPink },
        Structure { DraculaPink },
        Typedef { DraculaPink },

        Type { DraculaCyanItalic },

        Delimiter { DraculaFg },

        Special { DraculaPink },
        SpecialComment { DraculaCyanItalic },
        Tag { DraculaCyan },
        helpHyperTextJump { DraculaLink },
        helpCommand { DraculaPurple },
        helpExample { DraculaGreen },
        helpBacktick { Special },
    }
end)
