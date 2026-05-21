---
name: pr-reviewer
description: A specialized skill for managing the Pull Request review cycle, interacting with CodeRabbit, and applying fixes.
orchestration:
  manager: ralph
---

# Skill: PR Reviewer

This skill automates the collaboration between Antigravity and CodeRabbit (or other AI reviewers) to ensure PRs reach a merge-ready state autonomously.

## Instructions

When activated, you must:

1.  **Fetch Feedback:** Use `gh pr view [PR_ID] --json comments,reviews` to gather all reviewer input.
2.  **Analyze Suggestions:** Distinguish between "Actionable Issues", "Nitpicks", and "Approved" signals.
3.  **Apply Surgical Fixes:** 
    - For each valid issue, identify the file and line.
    - Use `replace` or `write_file` to apply the fix.
    - If a suggestion is ambiguous, use `gh pr comment [PR_ID] --body "@coderabbitai [Question]"` to ask for clarification.
4.  **Verify & Re-review:**
    - Run local tests/linters to verify the fix.
    - Commit and push the changes.
    - Post a comment: `@coderabbitai review` to trigger a follow-up.
5.  **Finalize:** Once the status is `APPROVED` and no actionable comments remain, notify **Ralph** for the final merge.

## Resources
- **templates/review-reply.md**: Templates for professional replies to reviewers.

## Orchestration
This skill is used by **Ralph** to coordinate the final quality assurance phase of the development pipeline.
