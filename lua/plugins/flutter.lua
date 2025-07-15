return {
    {
        "folke/lazy.nvim",
        lazy = false,  -- Assicurati che Lazy sia caricato all'avvio
        priority = 1000,  -- Priorità alta per caricarlo per primo
    },
    {
        "dart-lang/dart-vim-plugin",
        ft = "dart",  -- Carica solo per file Dart
        config = function()
            -- Configurazioni specifiche per Dart
            vim.g.dart_format_on_save = 1  -- Formatta automaticamente al salvataggio
            vim.g.dart_style_guide = 2     -- Usa lo stile di formattazione di Dart
        end,
    },

    {
        "thosakwe/vim-flutter",
        ft = "dart",  -- Carica solo per file Dart
        dependencies = { "dart-lang/dart-vim-plugin" },  -- Dipende da dart-vim-plugin
        config = function()
            -- Configurazioni specifiche per Flutter
            vim.g.flutter_default_device = "chrome"  -- Usa Chrome come dispositivo predefinito
            vim.g.flutter_run_args = ""              -- Argomenti aggiuntivi per `flutter run`
        end,
    },
}
