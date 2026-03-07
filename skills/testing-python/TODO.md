# Testing Python Skill — Improvements To-Do

## Bugs
- [x] `mocking.md`: Fix `requests.get.assert_called_once_with()` — `requests` is never imported in the test; capture the mock return value from `mocker.patch()` and assert on that instead

## Inconsistencies
- [x] `SKILL.md` Pattern 6: Replace `nullcontext as ok` with `nullcontext as does_not_raise` to match `testing-exceptions.md`
- [x] `SKILL.md` Pattern 3: Upgrade fixture example to match `fixtures-for-setup-or-teardown.md` quality (add type hint, AAA structure in test)

## Thin/Incomplete Files
- [x] `testing-async-code.md`: Add `asyncio_mode = "auto"` config, async fixtures, and `AsyncMock` example
- [x] `custom-fixtures-and-conftest.md`: Add a concrete `conftest.py` code example showing a shared fixture used across test files
- [x] `temporary-files-and-dirs.md`: Add `tmp_path_factory` example for module/session-scoped fixtures

## Missing Patterns in SKILL.md
- [x] Add fixture scopes (`scope="module"`, `scope="session"`) — common source of confusion, not covered
- [x] Add `monkeypatch` as a new pattern for env vars, attributes, and dict items
