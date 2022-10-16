print_log() {
    GREEN='\033[0;32m'
    NC='\033[0m'
    echo "${GREEN}$1${NC}"
}

print_log "Creating node TypeScript project in directory $PWD..."

print_log "Creating npm project..."

npm init -y

print_log "Installing dev dependencies..."

npm install typescript @types/node ts-node nodemon rimraf --save-dev

print_log "Setting up TypeScript config..."

npx tsc --init --rootDir src --outDir build \
    --esModuleInterop --resolveJsonModule --lib es6 \
    --module commonjs --allowJs true --noImplicitAny true

print_log "Setting up nodemon..."

touch nodemon.json

tee -a nodemon.json << END
{
    "watch": ["src"],
    "ext": ".ts,.js",
    "ignore": [],
    "exec": "ts-node ./src/index.ts"
}
END

print_log "Adding npm commands..."

jq '.scripts += {"start:dev": "nodemon"}' package.json > tmp.json \
    && mv tmp.json package.json

jq '.scripts += {"build": "rimraf ./build && tsc"}' package.json > tmp.json \
    && mv tmp.json package.json

jq '.scripts += {"start": "npm run build && node build/index.js"}' package.json > tmp.json \
    && mv tmp.json package.json

print_log "Creating server file..."

mkdir src

touch src/server.ts

tee -a src/server.ts << END
import express from "express";

const app = express();

app.use(express.json());

app.get("/", (req, res) => {
    res.json({ message: "Hello World!" });
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    console.log(`Server is running on port: ${PORT}...`)
});
END

