# Spec: 用户注册与登录（from intent.md 2026-10-06 — commit abc1234）
Generated under skills: <skill@version, ...>. Prompt: <link or inline>.

## Requirements

- 注册接口 POST /api/register，成功返回 201 和 user_id。
- 密码必须用 bcrypt 哈希存储。
- users 表必须有迁移脚本，包含 up/down。
- 邮箱必须唯一。
- 仓库当前为空，没有现有认证代码。

## Design

- 前端注册表单、后端 AuthService、数据库 users 表、邮件服务。
- 受 security-policy 约束：密码哈希、登录锁定。
- 受 ux-policy 约束：移动端登录方式。
- No approved mock exists yet.

## ⚠ CONCERN 1 — 密码与锁定规则冲突
SFC-001 要求密码至少 12 位，登陆失败 3 次锁定 30 分钟。
UX-001 要求移动端允许 6  位 PIN，登陆失败 5 次后锁定。
同一登录流程无法同时满足这两个政策。

Owner: @security-lead (SEC-001), @product-lead (UX-001). **NOT RESOLVED HERE.**

## ⚠ CONCERN 2 — 数据保留冲突

PRIV-001 要求用户注销后 30 天内删除所有个人数据。
ANA-001 要求注册数据保留至少 1 年用于分析。
无法同时满足“30 天删除”和“满足 1 年”.

Owner: @privacy-lead (PRIV-001), @analytics-lead (ANA-001). **NOT RESOLVED HERE.****
