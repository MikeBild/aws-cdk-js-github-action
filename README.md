# GitHub Action using AWS CDK for JavaScript

## How to use?

Create a GitHub workflow file `.github/workflows/main.yml`.

```yaml
name: CICD
on: [push]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - name: GitHub Checkout
      uses: actions/checkout@v1

    - name: Yarn Install
      uses: nuxt/actions-yarn@master
      with:
        args: install

    - name: AWS CDK Deploy
      uses: MikeBild/aws-cdk-js-github-action@1.0.0
      with:
        args: deploy
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_REGION: eu-central-1
```

## Secrets

- `AWS_ACCESS_KEY_ID` – **Required**
- `AWS_SECRET_ACCESS_KEY` – **Required**

## Environments

See [the CDK developer guide](https://docs.aws.amazon.com/cdk/latest/guide/environments.html) for more information.

# License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
