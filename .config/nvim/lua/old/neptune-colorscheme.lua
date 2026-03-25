return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				on_highlights = function(hl, c)
					local adm = {
						purple = "#987afb",
						green = "#37f499",
						cyan = "#04d1f9",
						pink = "#fca6ff",
						lime = "#9ad900",
						orange = "#e58f2a",
						bg = "#0D1116",
						bg1 = "#141b22",
						bg2 = "#232e3b",
						comment = "#b7bfce",
						spellbad = "#f16c75",
						spellcap = "#f1fc79",
						white = "#ffffff",
						selected = "#e9b3fd",
						cursor = "#f94dff",
						h1bg = "#2d244b",
						h2bg = "#10492d",
						h3bg = "#013e4a",
						h4bg = "#4b314c",
						h5bg = "#1e2b00",
						h6bg = "#2d1c08",
						hfg = "#0D1116",
					}

					hl.Normal = { fg = adm.white, bg = adm.bg }
					hl.NormalNC = { fg = adm.comment, bg = adm.bg1 }
					hl.CursorLine = { bg = adm.bg2 }
					hl.LineNr = { fg = adm.bg2 }
					hl.CursorLineNr = { fg = adm.purple, bold = true }
					hl.Visual = { bg = "#3d2a5e" }
					hl.Comment = { fg = adm.comment, italic = true }
					hl.Cursor = { fg = adm.bg, bg = adm.cursor }
					hl.BufferCurrent = { fg = "#0D1116", bg = "#987afb", bold = true }
					hl.BufferCurrentMod = { fg = "#0D1116", bg = "#987afb" }
					hl.BufferCurrentSign = { fg = "#0D1116", bg = "#987afb" }
					hl.BufferCurrentTarget = { fg = "#f16c75", bg = "#987afb", bold = true }

					hl.BufferVisible = { fg = "#987afb", bg = "#141b22" }
					hl.BufferVisibleMod = { fg = "#e58f2a", bg = "#141b22" }
					hl.BufferVisibleSign = { fg = "#232e3b", bg = "#141b22" }
					hl.BufferVisibleTarget = { fg = "#f16c75", bg = "#141b22", bold = true }

					hl.BufferInactive = { fg = "#b7bfce", bg = "#141b22" }
					hl.BufferInactiveMod = { fg = "#e58f2a", bg = "#141b22" }
					hl.BufferInactiveSign = { fg = "#232e3b", bg = "#141b22" }
					hl.BufferInactiveTarget = { fg = "#f16c75", bg = "#141b22", bold = true }

					hl.BufferTabpageFill = { fg = "#141b22", bg = "#0D1116" }
					hl.BufferTabpages = { fg = "#987afb", bg = "#0D1116", bold = true }

					hl.Keyword = { fg = adm.purple, bold = true }
					hl.Function = { fg = adm.cyan }
					hl.String = { fg = adm.green }
					hl.Constant = { fg = adm.pink }
					hl.Type = { fg = adm.lime }
					hl.Number = { fg = adm.orange }
					hl.Operator = { fg = adm.cyan }
					hl.Identifier = { fg = adm.white }

					hl["@markup.heading.1"] = { fg = adm.purple, bg = adm.h1bg, bold = true }
					hl["@markup.heading.2"] = { fg = adm.green, bg = adm.h2bg, bold = true }
					hl["@markup.heading.3"] = { fg = adm.cyan, bg = adm.h3bg, bold = true }
					hl["@markup.heading.4"] = { fg = adm.pink, bg = adm.h4bg, bold = true }
					hl["@markup.heading.5"] = { fg = adm.lime, bg = adm.h5bg, bold = true }
					hl["@markup.heading.6"] = { fg = adm.orange, bg = adm.h6bg, bold = true }

					hl["@markup.raw.block"] = { bg = adm.bg1 }
					hl["@markup.raw"] = { fg = adm.cyan, bg = adm.bg1 }
					hl["@markup.link.url"] = { fg = adm.cyan, underline = true }
					hl["@markup.link"] = { fg = adm.purple }

					hl.SpellBad = { undercurl = true, sp = adm.spellbad }
					hl.SpellCap = { undercurl = true, sp = adm.spellcap }

					hl.Pmenu = { fg = adm.white, bg = adm.bg1 }
					hl.PmenuSel = { fg = adm.hfg, bg = adm.purple, bold = true }

					hl.TelescopeBorder = { fg = adm.purple }
					hl.TelescopeSelectionCaret = { fg = adm.cursor }
				end,
			})
			vim.cmd("colorscheme tokyonight-moon")
		end,
	},
}
