# Persist Long-Running Command Output

Pipe long-running command output to a temporary/scratch file instead of running bare and reading only the tail. Re-running a 2-minute test suite to see output you skipped is wasteful; a single run plus persisted log suffices.

```bash
# Change /tmp/ to a different path as needed based on user preferences and repository conventions.
npm test > /tmp/test-output.log 2>&1; echo "exit=$?"
```

Then read the log.
