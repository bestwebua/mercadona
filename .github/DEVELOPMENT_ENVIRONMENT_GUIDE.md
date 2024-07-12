# Development environment guide

## Preparing

Clone `mercadona` repository:

```bash
git clone https://github.com/bestwebua/mercadona.git
cd  mercadona
```

Configure latest Ruby environment:

```bash
echo 'ruby-3.1.2' > .ruby-version
cp .circleci/gemspec_latest mercadona.gemspec
```

## Commiting

Commit your changes excluding `.ruby-version`, `mercadona.gemspec`

```bash
git add . ':!.ruby-version' ':!mercadona.gemspec'
git commit -m 'Your new awesome mercadona feature'
```
