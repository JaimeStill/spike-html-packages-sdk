# spike-html-packages-sdk

spike-html-packages-sdk is the sdk layer of
[spike-html-packages](https://github.com/JaimeStill/spike-html-packages): the SDK declarations, types only. It is
released by tag and built on by the layers above it, as the Go workspace's repositories are.
This context records only working knowledge the code and the README do not express.

## Capability map

The README lists the subpaths; the declarations and their doc comments are authoritative for the
API.

- **api**: `api.d.ts`, the API client over go-web-sdk's Problem and Page shapes, every call a
  Result that never rejects.
- **auth**: `auth.d.ts`, the TokenProvider the client asks for each call's bearer token.
- **router**: `router.d.ts`, the router on URLPattern and the Navigation API.
- **service**: `service.d.ts`, the stateless domain-service pattern over a Client.

## Layout

- `src/`: the declarations, the only home of the layer's code; `mise run build` copies them into
  `dist/`, which main never holds.
- `test/unit/`: tsc on scratch declaration trees; the lint over `layers-tree.js`'s tree; and
  `release.js`'s checks on a `pnpm pack` of `dist/`.
- `scripts/`: one script per task that needs more than one command.

## Tasks

- `mise run check`: `lint` (ESLint, Prettier, shellcheck, and actionlint), `types` (typescript-go),
  `build`, and `test:unit`; reads no network once `mise run install` has run, and writes only
  `dist/`.
- `mise run currency`: reads the network, so CI never runs it.

## Releases

`release.yml` runs on every push to main and cuts `v<version>` from `package.json` when the
remote has no such tag: the check, `pnpm pack`, a commit of the pack's `package/` whose one parent
is the pushed commit and which no branch holds, an annotated tag on it pushed alone, the GitHub
release from `CHANGELOG.md`, and the tarball attached. A version bump, with its changelog section,
is what releases; a push that bumps nothing ends green.
