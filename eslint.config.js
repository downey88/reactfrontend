
import js from "@eslint/js";
import globals from "globals";
import react from "eslint-plugin-react";
import babelParser from "@babel/eslint-parser";

export default [
  {
    ignores: ["node_modules/**", "dist/**"],
  },
  {
    files: ["**/*.{js,jsx}"],

    languageOptions: {
      parser: babelParser,
      ecmaVersion: 2018,
      sourceType: "module",
      parserOptions: {
        ecmaFeatures: {
          jsx: true,
        },
        allowImportExportEverywhere: true,
        requireConfigFile: false,
        babelOptions: {
          presets: ["@babel/preset-react"],
        },
      },
      globals: {
        ...globals.browser,
        ...globals.es6,
        ...globals.jest,
        Atomics: "readonly",
        SharedArrayBuffer: "readonly",
      },
    },

    plugins: {
      react,
    },

    rules: {
      ...js.configs.recommended.rules,
      ...react.configs.recommended.rules,
      "react/react-in-jsx-scope": "off",
    },

    settings: {
      react: {
        version: "detect",
      },
    },
  },
];
