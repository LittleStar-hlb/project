# CLAUDE.md

## Commands
- `npm test` — 运行单元测试。健康输出：`Tests: 12 passed, 12 total`。
- `npm run lint` — 运行 ESLint。健康输出：`✔ 0 problems`。

## Conventions
- API 错误统一为 `{ error: { code, message } }`。
- 每个新数据库字段必须有 up/down 迁移。
- 禁止在客户端明文存储 token。

## Architecture
- `src/api/` 路由，`src/services/` 业务逻辑，`src/db/` 数据访问，`migrations/` 数据库迁移。
- 硬边界：`migrations/` 只能由 DBA 团队通过审批修改，Claude 不得直接编辑。

## Things Claude gets wrong
- 会发明不存在的 npm scripts。
- 会在路由里直接访问数据库，绕过 `src/services/`。
- 会为了通过测试直接改 `migrations/`。
