def actividadesMasPeligrosas(dfActivity):
    return dfActivity.value_counts().head(5)
