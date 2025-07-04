return {
	cmd = { "harper-ls", "--stdio" },
	filetypes = {
		"c",
		"cpp",
		"cs",
		"gitcommit",
		"go",
		"html",
		"java",
		"javascript",
		"lua",
		"markdown",
		"nix",
		"python",
		-- "ruby",
		"rust",
		"swift",
		"toml",
		"typescript",
		"typescriptreact",
		"haskell",
		"cmake",
		"typst",
		"php",
		"dart",
	},
	root_markers = { ".git" },
	settings = {
		["harper-ls"] = {
			userDictPath = "",
			fileDictPath = "",
			linters = {
				SpellCheck = false, -- changed
				SpelledNumbers = false,
				AnA = true,
				SentenceCapitalization = false, -- changed
				UnclosedQuotes = true,
				WrongQuotes = false,
				LongSentences = true,
				RepeatedWords = true,
				Spaces = true,
				Matcher = true,
				CorrectNumberSuffix = true,
			},
			codeActions = {
				ForceStable = false,
			},
			markdown = {
				IgnoreLinkTitle = false,
			},
			diagnosticSeverity = "hint",
			isolateEnglish = false,
			dialect = "American",
		},
	},
}
