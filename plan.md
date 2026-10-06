# Plan: 添加用户注册
Approved by: <engineer>. Higher-risk sign-off: <tech lead, if applicable>.

## Files that change
- `src/api/auth.ts` — 新增 POST /api/register
- `src/services/auth-service.ts` — 注册逻辑、密码哈希
- `src/db/users.ts` — 用户查询
- `migrations/001_create_users.sql` — users 表
- `tests/auth.test.ts` — 注册测试

## Order of work
1. 写失败测试：注册成功返回 201 + user_id。
2. 写迁移和回滚，先让 DBA 评审。
3. 实现 users 数据访问。
4. 实现 AuthService，bcrypt 哈希。
5. 接 API 路由。
6. 跑全部测试和 lint。

## Risks

- 数据库可能出问题。
- 用户可能不配

## Proof
- `npm test -- auth` 输出 `Tests: 6 passed, 6 total`。
- `npm run lint` 输出 `✔ 0 problems`。
- 重复邮箱注册返回 409，测试用例 `auth.test.ts::duplicate_email` 覆盖。
- 迁移 up/down 各跑一次，`migrations/001_create_users.sql` 无报错。
- 密码字段在数据库为 bcrypt 哈希，测试 `auth.test.ts::password_hashed` 断言。

<!--
Acceptance bar: could an engineer who never saw the session implement this from
the plan alone? If implementation departs from this plan, update the plan IN THE
SAME COMMIT (back it with a hook).
-->
