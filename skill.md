---
name: ffd-finflow-data
description: Use when an AI agent needs to query FinFlow Data (FFD) financial data APIs, search stock codes or public fields, validate market or fundamental questions, or call the user's FFD MCP tools safely.
---

# FFD · FinFlow Data

Use the local MCP tools exposed by `ffd`. Never request, infer, expose, or probe internal data sources, internal accounts, tokens, usage pools, hosts, debug endpoints, licenses, passwords, internal connection details, or provider identities.

Current public MCP server version: `0.6.5`. Version `0.6.5` improves industry/concept and index-component routing: questions such as 半导体板块有哪些股票, 板块涨跌幅排名, and 沪深300成分股权重 are routed to `ffd_industry_stocks` or `ffd_route_plan` with official super-command precheck hints instead of misreading Chinese sectors or indices as security codes. Version `0.6.4` fixes 0.6.3 dispatcher gaps for fund NAV history, risk metrics, and MA-cross backtesting, and upgrades `ffd_capabilities` with progressive scene filtering such as `query="基金"` or `query="资金研报新闻联动"`. Version `0.6.3` adds `ffd_market_intelligence`, fund NAV history, risk metrics, and MA-cross backtesting so routing can choose money flow, news sentiment, research clues, fund NAV, risk, and backtest capabilities. Version `0.6.1` adds `ffd_route_plan`, a routing and fallback planner that recommends the right FFD tool, arguments, standard codes, fallback chain, and reusable-asset policy without turning every field into a separate tool. It also adds standard routes for DR007, customs import/export freight series, treasury-futures price/position series, and treasury-futures contract basic data, while guarding against unreliable CTD/basis lookups. Version `0.6.0` adds fund tools for search, profile, market performance, portfolio, ownership, fund financials, and fund-company information. Version `0.5.8` adds `ffd_capabilities`, technical-analysis tools for RSI/MACD/KDJ/MA/EMA/Bollinger/ATR/OBV, auxiliary trading signals, support/resistance levels, natural-language period parsing such as 最近90天, and large-result previews. Version `0.5.7` opens the FFD smart-screening route more fully and improves discovery for sector/concept fund-flow questions. Version `0.3.2` and later can auto-download newer `ffd_mcp_server.py` on startup; the update takes effect after the AI client restarts. Existing older users can run the public installer once to upgrade without reinstalling from scratch.

## Tools

- `ffd_route_plan`: smart routing and fallback planner. Prefer it first when you are unsure which tool/code to use, when the user asks "how to query", or when a request may need a reusable standard asset or fallback chain.
- `ffd_macro_data`: macro scene tool. Prefer it for GDP, CPI, PPI, PMI, M2, social financing, DR007, customs import/export freight, treasury-futures price/position, and similar macro time series.
- `ffd_screen_stocks`: smart-screening tool. Prefer it for concept, industry, market-cap, valuation, condition-based screening, sector/concept fund flow, and main-capital net-inflow questions.
- `ffd_money_flow`: money-flow scene tool. Prefer it for stock, sector, concept, northbound, main-capital, big-order, large-order, and real-time net-inflow ranking questions.
- `ffd_market_intelligence`: composite research tool. Prefer it for questions that combine money flow, news sentiment, research reports, catalysts, sector review, or cross-verification.
- `ffd_industry_stocks`: industry/concept component tool. Prefer it for industry constituents, concept constituents, and industry-level stock universe questions.
- `ffd_industry_indicators`: standard industry economic indicator search tool. Prefer it when the user asks what industry indicators are available, or searches for production, sales, investment, price, inventory, operating-rate, import/export, property, energy, steel, coal, power, non-ferrous metals, oil and gas, shipping freight, or semiconductor-cycle series.
- `ffd_industry_indicator_data`: standard industry economic indicator data tool. Prefer it for questions such as 新能源汽车产量近18个月, 碳酸锂价格走势, 钢铁库存, 高炉开工率, 铜价近6个月, BDI近1年, 美国EIA原油库存近6个月, DRAM价格近6个月, 房地产销售面积累计值.
- `ffd_industry_overview`: industry research overview tool. Prefer it for industry overviews, industry indicators, industrial-chain tracking, and mixed industry questions that need stocks, valuation samples, reports, news, and field discovery in one response.
- `ffd_industry_signal`: industry-cycle combination analysis tool. Prefer it for questions such as 半导体景气怎么样, 能源行业怎么看, 航运景气跟踪, 有色金属周期怎么看; it returns indicator direction, a simple signal, news-pool clues, research-library clues, and next observation points.
- `ffd_capabilities`: public capability map and recommended tool-dispatch helper. Prefer it when the user asks what FFD MCP can do or which tool families are available.
- `ffd_technical_indicators`: common technical indicator tool. Prefer it for RSI, MACD, KDJ, MA, EMA, Bollinger, ATR, OBV, and similar technical-analysis questions.
- `ffd_trading_signal`: auxiliary technical signal tool. Prefer it for 偏多、偏空、买入信号、卖出信号, and similar trading-signal questions; treat the output as data observation, not investment advice.
- `ffd_support_resistance`: support/resistance tool. Prefer it for 支撑位、阻力位, and support/resistance questions.
- `ffd_financial_metrics`: financial metric scene tool. Prefer it for ROE, net-profit growth, revenue growth, gross margin, PE, PB, and similar single-stock questions.
- `ffd_index_valuation`: index valuation scene tool. Prefer it for PE/PB and valuation-percentile style index questions.
- `ffd_announcements`: listed-company announcement tool. Prefer it for recent announcements, annual/quarterly report announcements, dividend announcements, buyback announcements, and shareholder-meeting notices.
- `ffd_trade_calendar`: date-query tool. Prefer it for trading-day, calendar-day, workday, and exchange calendar questions.
- `ffd_date_offset`: date-offset tool. Prefer it for T+n, previous/next trading-day, and date-shift questions.
- `ffd_futures_stock_link`: futures-stock-link tool. Prefer it for commodity or futures product related-stock questions.
- `ffd_topic_report`: topic-report tool. Use it when the user already has a valid `report_id` and matching report parameters.
- `ffd_research_search`: FFD research-library search tool. Prefer it for research report discovery; it requires active research entitlement for the current FFD API Key user.
- `ffd_research_detail`: FFD research-library detail tool. Use it after `ffd_research_search` returns a `file_id`.
- `ffd_research_download`: FFD research-library download-link tool. Use only when the user explicitly asks to download a specific report; it consumes one research download quota.
- `ffd_news_latest`: FFD global-news pool latest-flash tool. Prefer it for latest high-value news and briefings.
- `ffd_news_search`: FFD global-news pool search tool. Prefer it for keyword-based news/flash/intelligence questions.
- `ffd_nl_query`: lightweight natural-language router for quote, macro, financial, industry overview, screening, stock-code search, public-field search, and health checks.
- `ffd_regression_cases`: fixed regression question bank for FFD MCP upgrades. Use it when evaluating whether routing and core workflows still behave as expected.
- `ffd_quote_history`: scenario tool for historical stock/index quotes.
- `ffd_query`: general public FFD API caller, with `format=json` or `format=markdown`; markdown responses prioritize warnings, summaries, and readable tables.
- `ffd_functions`: public capability catalog with examples and parameter requirements.
- `ffd_search_stocks`: find standard stock codes by code, Chinese name, or pinyin.
- `ffd_search_indicators`: find FFD public field names before querying data.
- `ffd_health`: verify FFD connection status and MCP version.

## Safe Workflow

1. Clarify the target: security, date range, metric, market, and desired output.
2. If the user asks "how to query", mentions fallback, or the correct tool/code is unclear, call `ffd_route_plan` first. If the user asks for stock/index historical performance in natural language, try `ffd_stock_performance` first. If the user asks for minute quotes, technical indicators, trading signals, support/resistance, macro, screening, money flow, composite market intelligence, industry constituents, industry overview, announcements, research reports, news flashes, financial metrics, or index valuation, use the dedicated scene tool first. For mixed routing needs, use `ffd_nl_query`.
3. If the stock code or public field is uncertain, search first.
4. Pick the correct public capability:
   - `history`: historical market quotes and common quote fields.
   - `realtime_quote`: real-time quote snapshot. Common fields: `latest;changeRatio;volume;amount`.
   - `date_series`: date-series data with public FFD field names.
   - `basic_data`: cross-sectional fundamentals or attributes. Usually requires `options/paramOption`.
   - `intraday`: high-frequency or minute data with timestamps to seconds.
   - `macro`: macro series.
   - `screen`: smart screening, including concept/sector fund-flow and main-capital net-inflow questions.
   - `announcement`: announcement query.
   - `special`: specialty datasets exposed by FFD.
5. For historical quotes, common aliases such as `收盘价和涨跌幅`, `开高低收`, `OHLC`, `K线`, `交易额`, `收益率`, and `成交量成交额` can be passed directly. Use `adjust="不复权"`, `adjust="前复权"`, or `adjust="后复权"` when the user asks for an adjusted price basis.
6. Field conventions:
   - Historical daily quotes use `amt` for turnover amount.
   - Minute quotes and real-time snapshots use `amount` for turnover amount.
   - Real-time snapshots use `changeRatio` for percent change.
   - Announcement queries should use parameter keys like `beginrDate`, `endrDate`, and `reportType`; the MCP can convert common old spellings automatically.
   - Common macro terms such as GDP, CPI, PPI, PMI, M2, 社融, DR007, 海关进出口货运总量, 国债期货价格/持仓, and CBOT U.S. treasury-futures positions can be searched with `ffd_search_indicators` or queried directly with `ffd_macro_data`.
   - Treasury-futures contract basic data can be asked directly with `ffd_topic_report` or through `ffd_route_plan`; the current stable report preset is 国债期货合约基本资料.
   - CTD, cheapest-to-deliver, and treasury-futures basis questions require confirmed public fields or report parameters. If no stable route is available, explain that FFD has not standardized that CTD/basis route yet instead of guessing from similarly named fields.
   - Common financial terms such as ROE, 净利润同比, 营收同比, 毛利率, PE, and PB can be asked directly with `ffd_financial_metrics`.
   - Announcement questions can be asked directly with `ffd_announcements`; if the user only says "recent", the tool defaults to the recent six-month window.
   - Industry/concept universe questions can be asked directly with `ffd_industry_stocks`; use `ffd_screen_stocks` for broader multi-condition stock screening and fund-flow questions such as 板块资金流向、概念资金净流入、主力资金净流入.
   - Money-flow questions can be asked directly with `ffd_money_flow`, especially 板块实时资金净流入、概念主力净流入排名、大单净流入、超大单净流入、北向资金流向.
   - Composite research questions should use `ffd_market_intelligence` first when the user combines money flow, news sentiment, research reports, catalysts, or sector review. It returns money-flow clues, sentiment distribution, research-library clues, and next checks; one empty section should not block the other sections.
   - Standard industry economic indicators can be searched with `ffd_industry_indicators` and queried with `ffd_industry_indicator_data`; coverage includes 新能源汽车产量、汽车产销、光伏电池产量、集成电路产量、工业机器人产量、锂离子电池产量、房地产开发投资、商品房销售面积、水泥产量、粗钢产量、原煤产量、发电量、社零、碳酸锂/氢氧化锂价格、多晶硅/硅片/光伏组件价格、螺纹钢/动力煤/水泥价格、钢材/螺纹钢/煤炭库存、高炉/PTA/焦化厂/半钢胎开工率、集成电路进出口、汽车出口、铜铝价格、原油/天然气价格、BDI/BDTI运费指数、美国EIA能源库存、全球半导体销售额、DRAM/NAND价格、费城半导体指数.
   - Industry overview and industry-indicator style questions can be asked directly with `ffd_industry_overview`; it returns current stable FFD data first and clearly marks industrial economic series that are still being standardized.
   - Industry-cycle or "how is this industry doing" questions should use `ffd_industry_signal`; it combines stable industry indicators with FFD news and research clues. Treat the signal as a structured data read, not as investment advice.
   - Technical-analysis questions can be asked directly with `ffd_technical_indicators`, `ffd_trading_signal`, or `ffd_support_resistance`. Treat these outputs as structured observations, not investment advice.
   - Research-library questions can be asked directly with `ffd_research_search`; details and download links require the returned `file_id`.
   - Global-news questions can be asked directly with `ffd_news_latest` or `ffd_news_search`; the response returns FFD-normalized headline, facts, insight, score, sector, and time.
7. For user-facing answers, prefer `format=markdown` when using `ffd_query` or `ffd_quote_history`, and summarize the returned table instead of pasting raw JSON unless the user asks for it.
8. Summarize results with date range and caveats only. Do not mention data source, provider identity, internal interface names, internal field names, internal usage details, source URLs, raw page titles, channel names, UID fields, or low-level error details.
9. If FFD returns an error or warning, explain the public parameter issue and suggest a corrected query. For HK historical quotes, prefer four-digit codes such as `0700.HK`; the MCP also accepts common variants such as `00700.HK` and `700.HK`.

## Guardrails

Do not call sensitive or internal functions, including names containing:
`account`, `token`, `usage`, `license`, `secret`, `password`, `debug`, `data_statistics`, internal provider names, or account status.

Do not ask the user for external provider credentials. The only credential needed locally is the user's own FFD API Key configured in MCP.

## Troubleshooting

- If Python is missing, ask the user to check first:
  ```bash
  python3 --version || python --version
  ```
- On macOS, if Python is missing, ask the user to run this in Terminal:
  ```bash
  if ! command -v brew >/dev/null 2>&1; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi; eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"; brew install python
  ```
- On Windows, if Python is missing, ask the user to run this in Windows PowerShell:
  ```powershell
  winget install -e --id Python.Python.3.12
  ```
- If PowerShell blocks script execution, ask the user to run:
  ```powershell
  Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force
  ```
- If the FFD tools do not appear, restart the AI client and confirm the MCP JSON has been placed in the correct client config file.
- If authentication fails, rerun the installer and paste the complete FFD API Key only in the local terminal prompt.

## Examples

User: `查一下通信设备指数最近 10 个交易日的收盘价和成交额`

Plan:
1. Use `ffd_quote_history`.
2. Codes: `881129.TI`.
3. Indicators: `close;amt`.
4. Return a compact table and trend summary.

User: `查一下宁德时代最近 10 个交易日收盘价`

Plan:
1. Try `ffd_nl_query`.
2. If needed, search `宁德时代` with `ffd_search_stocks`.
3. Query the public historical quote capability with `close`.
4. Return a compact table and trend summary.

User: `查一下苹果现在的最新价和涨跌幅`

Plan:
1. Use `ffd_query` with `function="realtime_quote"`.
2. Codes: `AAPL.O`.
3. Indicators: `latest;changeRatio;volume;amount`.
4. Return the quote snapshot and avoid mentioning provider or internal route details.

User: `帮我筛选白酒概念股`

Plan:
1. Use `ffd_screen_stocks` with `query="属于白酒概念"`, `market="stock"`.
2. Summarize the returned universe and remind the user it is a screening result, not investment advice.

User: `查贵州茅台最近公告`

Plan:
1. Use `ffd_announcements` with `query="贵州茅台最近公告"`.
2. Return recent announcement dates and titles only.

User: `半导体行业市值大于1000亿的股票`

Plan:
1. Use `ffd_industry_stocks` with `query="半导体行业市值大于1000亿的股票"`.
2. Summarize the matching stock universe and key fields.

User: `半导体行业研究概览`

Plan:
1. Use `ffd_industry_overview` with `query="半导体行业研究概览"`.
2. Summarize available industry stocks, valuation samples, research reports, news, and field-discovery results.
3. If industrial economic series such as production, sales, inventory, or price are not returned, say they are not yet standardized in FFD instead of inventing values.

User: `半导体资金流向和新闻情感研报联动`

Plan:
1. Use `ffd_market_intelligence` with `query="半导体资金流向和新闻情感研报联动"` and `format="markdown"`.
2. Return money-flow clues, news-sentiment distribution, research-library clues, and next checks.
3. If one section is empty, explain that section only and still summarize the other available sections.

User: `新能源汽车产量近18个月走势`

Plan:
1. Use `ffd_industry_indicator_data` with `query="新能源汽车产量近18个月走势"`.
2. Return the time series as a compact table and mention the indicator title and date range.

User: `碳酸锂价格近6个月走势`

Plan:
1. Use `ffd_industry_indicator_data` with `query="碳酸锂价格近6个月走势"`.
2. Return the time series as a compact table and mention the matched price indicator title.

User: `钢铁库存近12个月`

Plan:
1. Use `ffd_industry_indicator_data` with `query="钢铁库存近12个月"`.
2. Return the matched inventory series and date range.

User: `半导体景气怎么样`

Plan:
1. Use `ffd_industry_signal` with `query="半导体景气怎么样"`.
2. Return the signal, core indicator table, recent news clues, research-library clues, and next observation points.

User: `能源行业怎么看`

Plan:
1. Use `ffd_industry_signal` with `query="能源行业怎么看"`.
2. Explain oil/gas price and inventory direction together with available news and research clues.

User: `铜价近6个月走势`

Plan:
1. Use `ffd_industry_indicator_data` with `query="铜价近6个月走势"`.
2. Return the matched copper price series and date range.

User: `BDI近1年走势`

Plan:
1. Use `ffd_industry_indicator_data` with `query="BDI近1年走势"`.
2. Return the Baltic freight index series and date range.

User: `美国EIA原油库存近6个月`

Plan:
1. Use `ffd_industry_indicator_data` with `query="美国EIA原油库存近6个月"`.
2. Return the matched U.S. crude inventory series and date range.

User: `DRAM价格近6个月`

Plan:
1. Use `ffd_industry_indicator_data` with `query="DRAM价格近6个月"`.
2. Return the matched memory price series and date range.

User: `搜索房地产行业指标`

Plan:
1. Use `ffd_industry_indicators` with `q="房地产"`.
2. Return available FFD standard industry indicators and their `field`.

User: `查一下半导体研报`

Plan:
1. Use `ffd_research_search` with `q="半导体"`.
2. Return matching report titles, publish dates, institutions, industries, and `file_id`; do not download unless the user asks.

User: `查一下芯片相关新闻`

Plan:
1. Use `ffd_news_search` with `q="芯片"`.
2. Return headline, sector, core facts, insight, score, and time; do not mention raw source URLs.

User: `中国近5个季度GDP同比增速`

Plan:
1. Use `ffd_macro_data`.
2. Query the GDP preset with recent periods inferred from the question.
3. Return the macro time series as a compact table.

User: `贵州茅台2024年ROE和净利润同比`

Plan:
1. Use `ffd_financial_metrics`.
2. Keep the year and metric wording in the query.
3. Return the matched financial columns and clarify the report period shown in column names.


## 0.6.5 更新

- 增强行业/概念成分股问法：`半导体板块有哪些股票`、`半导体板块今日涨跌幅排名` 会优先走 `ffd_industry_stocks`，并自动规范为行业/概念成分股查询。
- 增强指数成份和权重预检：`沪深300指数成分股权重` 会返回 `ffd_route_plan` 和官方超级命令模板提示，先解析标准指数代码再调用专题报表，避免误把中文指数名当证券代码。
- `ffd_route_plan` 新增官方超级命令模板提示，用人话说明需要先解析 sectorid / index_code，再进入专题报表或场景工具。

## 0.6.4 更新

- 正式发布 0.6.3 热修：补齐 `ffd_fund_nav_history`、`ffd_risk_metrics`、`ffd_backtest_ma_cross` 的真实调用分发，避免 tools/list 看得到但 tools/call 调不通。
- `ffd_capabilities` 支持按场景渐进发现，例如 `query="基金"`、`query="资金研报新闻联动"`，减少智能体一次读完整工具面。
- 能力地图补齐基金历史净值序列，并继续强调少量高价值工具、智能路由、多源容灾和可复用资产库。

## 0.6.3 更新

- 新增基金历史净值序列、风险收益指标和双均线轻量回测。
- 合并资金流向、新闻情感和研报联动能力，继续强化智能路由、多源容灾和可复用资产策略。
- 建议不确定工具时先调用 `ffd_route_plan` 或 `ffd_nl_query`，由 FFD 自动选择合适入口。
