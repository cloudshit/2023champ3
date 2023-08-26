solution with following limits:
```
no cross-region
no git-ops
```

```
tolerations:
- effect: NoSchedule
key: dedicated
operator: Equal
value: tool

affinity:
nodeAffinity:
requiredDuringSchedulingIgnoredDuringExecution:
nodeSelectorTerms:
- matchExpressions:
- key: unicorn/dedicated
operator: In
values:
- tool
```
