# Intent: 用户注册和登录
Author: <name> (<function>). Status: draft | accepted | closed.

## Problem
目前项目没有用户账户系统，每次测试多用户场景时，需要手动在数据库插入用户记录，平均每次 3 分钟，每天约 5 次，每天浪费 15 分钟。无法验证“用户只能看到自己的数据”这类需求。

## Proposed outcome
用户可以注册、登录、登出。注册后可以创建自己的数据，并且只能看到自己的数据。

## Affected users and systems
用户：首批 20 个测试用户。
系统：前端、后端 API、数据库、邮件服务。

## Constraints
1. 注册接口必须返回 201 状态码和 user_id 字段，diff 中缺少则失败。
2. 密码必须用 bcrypt 哈希存储。diff 中出现明文密码则失败。
3. 数据库必须有 users 表和 migrations 脚本。diff 中缺少迁移文件则失败。
4. 登陆失败 5 次后锁定 15 分钟。diff 中登录逻辑没有失败统计数则失败。

## Open questions
1. 是否允许用邮箱作为用户名？
2. 是否需要邮箱验证？
3. 是否支持第三方登录？
4. 用户注销后数据保留多久？
