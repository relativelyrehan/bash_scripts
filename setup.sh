#!/bin/sh
echo "what is Project Name?"
read name
npx create-next-app $name
cd $name
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
rm tailwind.config.js
touch tailwind.config.js
echo 'module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}' > tailwind.config.js
rm -R styles
mkdir styles
cd styles
touch globals.css
touch Home.module.css
echo '@tailwind base;@tailwind components;@tailwind utilities;' > globals.css
cd ..
rm .eslintrc.json
touch .eslintrc.json
echo '{
  "extends": ["next", "next/core-web-vitals", "eslint:recommended"],
  "globals": {
    "React": "readonly"
  },
  "rules": {
    "no-unused-vars": [1, { "args": "after-used", "argsIgnorePattern": "^_" }]
  }
}' > .eslintrc.json
npm install --save-dev prettier
touch .prettierrc .prettierignore
echo '{
  "trailingComma": "es5",
  "tabWidth": 2,
  "semi": true,
  "singleQuote": true
}' > .prettierrc
echo '.yarn
.next
dist
node_modules' > .prettierignore
npm install --save-dev husky
npx husky install
sed '8 i "prepare": "husky install"' package.json
npx husky add .husky/pre-commit "npm run lint"
npx husky add .husky/pre-push "npm run build"
mkdir components utils
cd components
mkdir Animations Block common Icons Layout
cd Animations && touch index.js && cd ..
cd Block && touch index.js && cd ..
cd common && touch index.js && cd ..
cd Icons && touch index.js && cd ..
cd Layout && touch index.js && cd ..
cd ../utils
mkdir apis constants context helpers hooks services
cd apis && touch index.js && cd ..
cd constants && touch index.js && cd ..
cd context && touch index.js && cd ..
cd helpers && touch index.js && cd ..
cd hooks && touch index.js && cd ..
cd services && touch index.js && cd ..
cd ..
cd pages
rm index.js
touch index.js
echo 'export default function Home() {
  return <div className="flex h-screen w-full items-center justify-center bg-black font-mono"><p className="text-purple-500 font-semibold text-3xl">Coded by Rehan</p></div>;
}
' > index.js
cd ..
npm run dev


