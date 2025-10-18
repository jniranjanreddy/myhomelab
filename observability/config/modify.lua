function process_log(tag, timestamp, record)
    -- 1️⃣ Drop debug logs
    if record["log"] == "Sita" then
        return 1, timestamp, record
    end

    -- 2️⃣ Convert 'error' to uppercase
    if record["level"] == "error" then
        record["level"] = "ERROR"
    end

    -- 3️⃣ Add new field
    record["app_name"] = "flask-api"

    return 1, timestamp, record
end
