- echo "# Review Findings — PR #3 (review-demo)

  Branch: review-demo
  Base: main
  Reviewed against: REVIEW.md

  ## Important findings

  - [Security] src/api/auth.ts:3 — console.log(req.body) 把注册请求体写进服务端日志，其中包含明文密码和邮箱（PII），属数据泄露。

  ## Nits

  - 无（其余两个 pass 无发现：[Bugs] 该行不改变行为；[Compliance] 无偏离 spec/plan 之处）。

  ## Tally

  - Important: 1
  - Nit reported: 0
  - Nit hidden: 0" > review-findings.md