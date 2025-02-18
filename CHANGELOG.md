## [_Unreleased_](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.4.3...main)

- Remove the orphan instance ToJSON ByteString

## [v0.0.4.3](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.4.2...v0.0.4.3)

- Include `package.yaml` in release tarball

  We read `default-extensions` out of it for doctests.

## [v0.0.4.2](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.4.1...v0.0.4.2)

- Support Aeson 2.0

## [v0.0.4.1](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.4.0...v0.0.4.1)

- Fix invalid URLs in Request tab (missing leading `/`s in paths)

## [v0.0.4.0](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.3.1...v0.0.4.0)

- Fixed serialization of headers in BugsnagRequest

  Previously, headers were a list of:

  ```
  [(CI ByteString, ByteString)]
  ```

  So they serialized as an array, but Bugsnag only accepts objects for headers.

  To solve this, the `newtype BugsnagRequestHeaders` wraps the headers and has a
  correct `ToJSON` instance.

## [v0.0.3.1](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.3.0...v0.0.3.1)

- Tag SomeException with the underlying exception class

## [v0.0.3.0](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.2.2...v0.0.3.0)

- Fix sensitive request header redacting
- Remove `defaultBeforeNotify`

## [v0.0.2.2](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.2.1...v0.0.2.2)

Packaging changes only.

## [v0.0.2.1](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.2.0...v0.0.2.1)

- Set StackFrame as in-project based on the `CodeIndex` when present
- Correctly parse `throwString` exceptions with newlines in the message

## [v0.0.2.0](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.1.3...v0.0.2.0)

- Add `CodeIndex` support

  Adds a Template Haskell function to read your project source into an in-memory
  Map structure to be set on your `BugsnagSettings` value. Then, as part of
  notification, we can attach lines of source context to the StackFrames we
  have. NOTE: This has memory-footprint implications, so is entirely opt-in.

  See https://github.com/pbrisbin/bugsnag-haskell/pull/39

## [v0.0.1.3](https://github.com/pbrisbin/bugsnag-haskell/compare/v0.0.1.2...v0.0.1.3)

- Redact sensitive request headers by default
  [#31](https://github.com/pbrisbin/bugsnag-haskell/issues/31)

  **NOTE**: this wasn't actually working at this point. It is actually fixed in
  v0.0.3.0.

- Deprecate Settings that should be `BeforeNotify` values
  [#32](https://github.com/pbrisbin/bugsnag-haskell/issues/32)
- `bugsnagShouldNotify` operates after any `BeforeNotify` changes

## [v0.0.1.2](https://github.com/pbrisbin/bugsnag-haskell/tree/v0.0.1.2)

- Make App Version an opaque `Text`, not a structured `Version`
  ([@MaxGabriel](https://github.com/pbrisbin/bugsnag-haskell/pull/29))

## [v0.0.1.1](https://github.com/pbrisbin/bugsnag-haskell/tree/v0.0.1.1)

First (pre-) released version.
