module.exports = {
  "parserOptions": {
    "ecmaVersion": 6,
    "sourceType": "module",
    "esversion": "6",
    "ecmaFeatures": {
      "jsx": true,
      "legacyDecorators": true
    }
  },
  "parser": "typescript-eslint-parser",
  "rules": {
    "semi":0,
    'eqeqeq': [
      'error',
      'always',
      {
        null: 'ignore'
      }
    ],
    'typescript/class-name-casing': 'error'
  },
  extends: [
  ],
  plugins: [
    'html',
    'typescript'
  ],
  settings: {
    "html/html-extensions": [".html", ".vue"],  // consider .html and .we files as HTML
  }
}
