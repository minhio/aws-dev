#!/usr/bin/env python3

import aws_cdk as cdk

from cdk_sandbox.cdk_sandbox_stack import CdkSandboxStack


app = cdk.App()
CdkSandboxStack(app, "CdkSandboxStack")

app.synth()
