# Review instructions

## Passes
Run three passes and tag each finding with its pass:
- Bugs: logic errors, broken edge cases, subtle regressions
- Security: injection risks, authentication gaps, PII in logs or error messages
- Compliance: the change matches spec.md, plan.md and our design principles

## What Important means here
Reserve Important for findings that would break behaviour, leak data
or breach a policy. Style and naming are nits.

## Cap the nits
Report at most five nits per review; summarize the rest as a count.

## Do not report
- Generated files under/ and dist/
- Anything  `npm run lint` already enforces
- Test fixtures under tests/fixtures/

<!--
Tune this monthly: rate finding quality, adjust the cap, add exclusions.
A set-and-forget REVIEW.md drifts into noise within a quarter.
-->
