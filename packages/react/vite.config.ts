import { defineConfig } from "vitest/config";
import typescript from "@rollup/plugin-typescript";
import { nodeResolve } from "@rollup/plugin-node-resolve";
import commonjs from "rollup-plugin-commonjs";
import peerDepsExternal from "rollup-plugin-peer-deps-external";
import pluginJson from "@rollup/plugin-json";
import { resolve } from "path";
import dts from "vite-plugin-dts";

/**
 * @see https://vitejs.dev/config/
 */
export default defineConfig({
  build: {
    lib: {
      entry: resolve(__dirname, "src/index.ts"),
      formats: ["umd"],
      name: "pwp",
      fileName: "window-ethereum",
    },
    outDir: "dist",
    minify: false,
  },
  test: {
    environment: "jsdom",
    globals: true,
  },
  plugins: [dts(), nodeResolve() as any, typescript(), commonjs(), peerDepsExternal(), pluginJson()],
});
