def cleanTextInFatal(text):
    """
    devuelve "N" si text contiene N o N o f o F o # o devuelve "UNKNOWN" si contiene "unkn"
    """
    if "un" not in text and "n" in text or "N" in text or "f" in text or "F" in text or "#" in text:
        return "N"
    elif "unkn" in text or "UNK" in text:
        return "UNKNOWN"
    else:
        return "Y"


