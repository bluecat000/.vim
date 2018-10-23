module.exports = {
  "parserOptions": {
    "ecmaVersion": 6,
    "sourceType": "module",
    "esversion": "6",
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "parser": "babel-eslint",
  "rules": {
    "semi":0
  },
  extends: [
  ],
  plugins: [
    'html'
  ],
  settings: {
    "html/html-extensions": [".html", ".vue"],  // consider .html and .we files as HTML
  }
}
