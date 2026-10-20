DESCRIBE TABLE PROD_ANALYTICS_DB.PRODUCTION_SEGMENT_MARKETING.ATTEMPTED_SIGNUP; -- table row check

------- break ------


-- general QA -- 
SELECT
    ANONYMOUS_ID
    , RECEIVED_AT
    , CONTEXT_PAGE_PATH
    , CONTEXT_PAGE_URL
    , CONTEXT_PAGE_HASH
    , CONTEXT_PAGE_REFERRER
    , CONTEXT_CAMPAIGN_SOURCE
    , PROPERTIES_STEP_STATUS
    , PROPERTIES_STEP_NUMBER
    , PROPERTIES_FAILURE_TYPE
    , TIME_ZONE
    , CONTEXT_LOCALE
FROM PROD_ANALYTICS_DB.PRODUCTION_SEGMENT_MARKETING.ATTEMPTED_SIGNUP
WHERE RECEIVED_AT >= '2026-10-01'
; 


------- break ------
-- day over day comparisons -- 
SELECT
    DATE(RECEIVED_AT) AS SIGNUP_DATE
    , COUNT(*) AS TOTAL_ROWS
    , COUNT_IF(LOWER(PROPERTIES_STEP_STATUS) = 'success') AS SUCCESS_COUNT
    , COUNT_IF(LOWER(PROPERTIES_STEP_STATUS) IN ('failed', 'failure')) AS FAILED_COUNT
FROM PROD_ANALYTICS_DB.PRODUCTION_SEGMENT_MARKETING.ATTEMPTED_SIGNUP
WHERE RECEIVED_AT >= '2026-10-01'
GROUP BY 1
ORDER BY 1
;

/* the above was run at 0930 hrs OCT 20, 2026, below is the output
+---------------------------------------------------------+
| SIGNUP_DATE | TOTAL_ROWS | SUCCESS_COUNT | FAILED_COUNT |
|-------------+------------+---------------+--------------|
| 2026-10-01  | 171        | 90            | 62           |
| 2026-10-02  | 96         | 61            | 28           |
| 2026-10-03  | 44         | 23            | 16           |
| 2026-10-04  | 39         | 24            | 11           |
| 2026-10-05  | 196        | 98            | 88           |
| 2026-10-06  | 190        | 92            | 67           |
| 2026-10-07  | 126        | 66            | 48           |
| 2026-10-08  | 141        | 77            | 47           |
| 2026-10-09  | 138        | 79            | 49           |
| 2026-10-10  | 48         | 29            | 14           |
| 2026-10-11  | 49         | 32            | 9            |
| 2026-10-12  | 155        | 86            | 54           |
| 2026-10-13  | 182        | 90            | 71           |
| 2026-10-14  | 119        | 72            | 29           |
| 2026-10-15  | 145        | 73            | 56           |
| 2026-10-16  | 150        | 94            | 48           |
| 2026-10-17  | 64         | 37            | 23           |
| 2026-10-18  | 57         | 38            | 9            |
| 2026-10-19  | 150        | 69            | 64           |
| 2026-10-20  | 42         | 23            | 11           |
+---------------------------------------------------------+
*/

------- break ------

