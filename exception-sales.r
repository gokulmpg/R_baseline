{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c5d231f9",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:09.791918Z",
     "iopub.status.busy": "2023-07-10T12:57:09.789136Z",
     "iopub.status.idle": "2023-07-10T12:57:10.927579Z",
     "shell.execute_reply": "2023-07-10T12:57:10.925787Z"
    },
    "papermill": {
     "duration": 1.148968,
     "end_time": "2023-07-10T12:57:10.930180",
     "exception": false,
     "start_time": "2023-07-10T12:57:09.781212",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.2     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.2     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'supermarket-sales'"
      ],
      "text/latex": [
       "'supermarket-sales'"
      ],
      "text/markdown": [
       "'supermarket-sales'"
      ],
      "text/plain": [
       "[1] \"supermarket-sales\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "dfdd7213",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:10.971075Z",
     "iopub.status.busy": "2023-07-10T12:57:10.941407Z",
     "iopub.status.idle": "2023-07-10T12:57:11.004406Z",
     "shell.execute_reply": "2023-07-10T12:57:11.002655Z"
    },
    "papermill": {
     "duration": 0.071843,
     "end_time": "2023-07-10T12:57:11.006809",
     "exception": false,
     "start_time": "2023-07-10T12:57:10.934966",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df = read.csv(\"../input/supermarket-sales/supermarket_sales - Sheet1.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "bc883ba8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.018670Z",
     "iopub.status.busy": "2023-07-10T12:57:11.017235Z",
     "iopub.status.idle": "2023-07-10T12:57:11.034893Z",
     "shell.execute_reply": "2023-07-10T12:57:11.033239Z"
    },
    "papermill": {
     "duration": 0.025996,
     "end_time": "2023-07-10T12:57:11.037210",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.011214",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Invoice.ID'</li><li>'Branch'</li><li>'City'</li><li>'Customer.type'</li><li>'Gender'</li><li>'Product.line'</li><li>'Unit.price'</li><li>'Quantity'</li><li>'Tax.5.'</li><li>'Total'</li><li>'Date'</li><li>'Time'</li><li>'Payment'</li><li>'cogs'</li><li>'gross.margin.percentage'</li><li>'gross.income'</li><li>'Rating'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Invoice.ID'\n",
       "\\item 'Branch'\n",
       "\\item 'City'\n",
       "\\item 'Customer.type'\n",
       "\\item 'Gender'\n",
       "\\item 'Product.line'\n",
       "\\item 'Unit.price'\n",
       "\\item 'Quantity'\n",
       "\\item 'Tax.5.'\n",
       "\\item 'Total'\n",
       "\\item 'Date'\n",
       "\\item 'Time'\n",
       "\\item 'Payment'\n",
       "\\item 'cogs'\n",
       "\\item 'gross.margin.percentage'\n",
       "\\item 'gross.income'\n",
       "\\item 'Rating'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Invoice.ID'\n",
       "2. 'Branch'\n",
       "3. 'City'\n",
       "4. 'Customer.type'\n",
       "5. 'Gender'\n",
       "6. 'Product.line'\n",
       "7. 'Unit.price'\n",
       "8. 'Quantity'\n",
       "9. 'Tax.5.'\n",
       "10. 'Total'\n",
       "11. 'Date'\n",
       "12. 'Time'\n",
       "13. 'Payment'\n",
       "14. 'cogs'\n",
       "15. 'gross.margin.percentage'\n",
       "16. 'gross.income'\n",
       "17. 'Rating'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Invoice.ID\"              \"Branch\"                 \n",
       " [3] \"City\"                    \"Customer.type\"          \n",
       " [5] \"Gender\"                  \"Product.line\"           \n",
       " [7] \"Unit.price\"              \"Quantity\"               \n",
       " [9] \"Tax.5.\"                  \"Total\"                  \n",
       "[11] \"Date\"                    \"Time\"                   \n",
       "[13] \"Payment\"                 \"cogs\"                   \n",
       "[15] \"gross.margin.percentage\" \"gross.income\"           \n",
       "[17] \"Rating\"                 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "169bd2d1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.050309Z",
     "iopub.status.busy": "2023-07-10T12:57:11.048798Z",
     "iopub.status.idle": "2023-07-10T12:57:11.132839Z",
     "shell.execute_reply": "2023-07-10T12:57:11.131053Z"
    },
    "papermill": {
     "duration": 0.093364,
     "end_time": "2023-07-10T12:57:11.135445",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.042081",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "f5 <- df %>% select(\"Branch\",\"City\",\"Customer.type\",\"Gender\",\"Total\",\"Date\",\"Time\")\n",
    "exceptionDF <- df%>% select(\"Total\",\"Date\",\"Time\",\"Payment\",\"cogs\",\"gross.margin.percentage\",\"gross.income\",\"Rating\")\n",
    "salesMaster <- df%>% select(\"Branch\",\"City\",\"Customer.type\",\"Product.line\",\"Unit.price\",\"Quantity\",\"Tax.5.\",\"Total\",\"Date\",\"Time\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "0555f315",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.148049Z",
     "iopub.status.busy": "2023-07-10T12:57:11.146394Z",
     "iopub.status.idle": "2023-07-10T12:57:11.159633Z",
     "shell.execute_reply": "2023-07-10T12:57:11.157938Z"
    },
    "papermill": {
     "duration": 0.022653,
     "end_time": "2023-07-10T12:57:11.162667",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.140014",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#dim(newdf)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "e3bdfd81",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.176968Z",
     "iopub.status.busy": "2023-07-10T12:57:11.175470Z",
     "iopub.status.idle": "2023-07-10T12:57:11.190793Z",
     "shell.execute_reply": "2023-07-10T12:57:11.189096Z"
    },
    "papermill": {
     "duration": 0.026698,
     "end_time": "2023-07-10T12:57:11.193944",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.167246",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Creating p2 key in f5 file\n",
    "f5$p2_key  <- paste(f5$Branch, f5$City,f5$Customer.type,sep='@')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "c0223a98",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.206405Z",
     "iopub.status.busy": "2023-07-10T12:57:11.204737Z",
     "iopub.status.idle": "2023-07-10T12:57:11.219569Z",
     "shell.execute_reply": "2023-07-10T12:57:11.217695Z"
    },
    "papermill": {
     "duration": 0.024029,
     "end_time": "2023-07-10T12:57:11.222494",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.198465",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Creating p2 key in salesmaster\n",
    "salesMaster$p2_key  <- paste(salesMaster$Branch, salesMaster$City,salesMaster$Customer.type,sep='@')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "af8c0d2b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.235720Z",
     "iopub.status.busy": "2023-07-10T12:57:11.234192Z",
     "iopub.status.idle": "2023-07-10T12:57:11.249161Z",
     "shell.execute_reply": "2023-07-10T12:57:11.247483Z"
    },
    "papermill": {
     "duration": 0.024497,
     "end_time": "2023-07-10T12:57:11.251661",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.227164",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "\n",
    "#Cretaing P3 key in salesmaster\n",
    "salesMaster$p3_key  <- paste(salesMaster$City,salesMaster$Customer.type,salesMaster$Product.line, sep='@')\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "03329bee",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.264647Z",
     "iopub.status.busy": "2023-07-10T12:57:11.263095Z",
     "iopub.status.idle": "2023-07-10T12:57:11.325536Z",
     "shell.execute_reply": "2023-07-10T12:57:11.323606Z"
    },
    "papermill": {
     "duration": 0.072246,
     "end_time": "2023-07-10T12:57:11.328542",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.256296",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22mJoining with `by = join_by(Branch, City, Customer.type, Total, Date, Time,\n",
      "p2_key)`\n"
     ]
    }
   ],
   "source": [
    "#Matching p2 in f5 and salesmaster to get p3 in f5 file\n",
    "#dt <- select(salesMaster,p2_key, p3_key)\n",
    "dt <- left_join(f5,salesMaster) "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "734b5391",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.341320Z",
     "iopub.status.busy": "2023-07-10T12:57:11.339711Z",
     "iopub.status.idle": "2023-07-10T12:57:11.355743Z",
     "shell.execute_reply": "2023-07-10T12:57:11.354025Z"
    },
    "papermill": {
     "duration": 0.046175,
     "end_time": "2023-07-10T12:57:11.379321",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.333146",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "exceptionDF <- cbind(exceptionDF,dt$p3_key)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "1d122e25",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.392605Z",
     "iopub.status.busy": "2023-07-10T12:57:11.391017Z",
     "iopub.status.idle": "2023-07-10T12:57:11.498769Z",
     "shell.execute_reply": "2023-07-10T12:57:11.496890Z"
    },
    "papermill": {
     "duration": 0.117208,
     "end_time": "2023-07-10T12:57:11.501216",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.384008",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1000 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Total</th><th scope=col>Date</th><th scope=col>Time</th><th scope=col>Payment</th><th scope=col>cogs</th><th scope=col>gross.margin.percentage</th><th scope=col>gross.income</th><th scope=col>Rating</th><th scope=col>dt$p3_key</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>548.9715</td><td>1/5/2019 </td><td>13:08</td><td>Ewallet    </td><td>522.83</td><td>4.761905</td><td>26.1415</td><td>9.1</td><td>Yangon@Member@Health and beauty        </td></tr>\n",
       "\t<tr><td> 80.2200</td><td>3/8/2019 </td><td>10:29</td><td>Cash       </td><td> 76.40</td><td>4.761905</td><td> 3.8200</td><td>9.6</td><td>Naypyitaw@Normal@Electronic accessories</td></tr>\n",
       "\t<tr><td>340.5255</td><td>3/3/2019 </td><td>13:23</td><td>Credit card</td><td>324.31</td><td>4.761905</td><td>16.2155</td><td>7.4</td><td>Yangon@Normal@Home and lifestyle       </td></tr>\n",
       "\t<tr><td>489.0480</td><td>1/27/2019</td><td>20:33</td><td>Ewallet    </td><td>465.76</td><td>4.761905</td><td>23.2880</td><td>8.4</td><td>Yangon@Member@Health and beauty        </td></tr>\n",
       "\t<tr><td>634.3785</td><td>2/8/2019 </td><td>10:37</td><td>Ewallet    </td><td>604.17</td><td>4.761905</td><td>30.2085</td><td>5.3</td><td>Yangon@Normal@Sports and travel        </td></tr>\n",
       "\t<tr><td>627.6165</td><td>3/25/2019</td><td>18:30</td><td>Ewallet    </td><td>597.73</td><td>4.761905</td><td>29.8865</td><td>4.1</td><td>Naypyitaw@Normal@Electronic accessories</td></tr>\n",
       "\t<tr><td>433.6920</td><td>2/25/2019</td><td>14:36</td><td>Ewallet    </td><td>413.04</td><td>4.761905</td><td>20.6520</td><td>5.8</td><td>Yangon@Member@Electronic accessories   </td></tr>\n",
       "\t<tr><td>772.3800</td><td>2/24/2019</td><td>11:38</td><td>Ewallet    </td><td>735.60</td><td>4.761905</td><td>36.7800</td><td>8.0</td><td>Naypyitaw@Normal@Home and lifestyle    </td></tr>\n",
       "\t<tr><td> 76.1460</td><td>1/10/2019</td><td>17:15</td><td>Credit card</td><td> 72.52</td><td>4.761905</td><td> 3.6260</td><td>7.2</td><td>Yangon@Member@Health and beauty        </td></tr>\n",
       "\t<tr><td>172.7460</td><td>2/20/2019</td><td>13:27</td><td>Credit card</td><td>164.52</td><td>4.761905</td><td> 8.2260</td><td>5.9</td><td>Mandalay@Member@Food and beverages     </td></tr>\n",
       "\t<tr><td> 60.8160</td><td>2/6/2019 </td><td>18:07</td><td>Ewallet    </td><td> 57.92</td><td>4.761905</td><td> 2.8960</td><td>4.5</td><td>Mandalay@Member@Fashion accessories    </td></tr>\n",
       "\t<tr><td>107.1420</td><td>3/9/2019 </td><td>17:03</td><td>Cash       </td><td>102.04</td><td>4.761905</td><td> 5.1020</td><td>6.8</td><td>Mandalay@Member@Electronic accessories </td></tr>\n",
       "\t<tr><td>246.4875</td><td>2/12/2019</td><td>10:25</td><td>Ewallet    </td><td>234.75</td><td>4.761905</td><td>11.7375</td><td>7.1</td><td>Yangon@Normal@Electronic accessories   </td></tr>\n",
       "\t<tr><td>453.4950</td><td>2/7/2019 </td><td>16:48</td><td>Ewallet    </td><td>431.90</td><td>4.761905</td><td>21.5950</td><td>8.2</td><td>Yangon@Normal@Food and beverages       </td></tr>\n",
       "\t<tr><td>749.4900</td><td>3/29/2019</td><td>19:21</td><td>Cash       </td><td>713.80</td><td>4.761905</td><td>35.6900</td><td>5.7</td><td>Yangon@Normal@Health and beauty        </td></tr>\n",
       "\t<tr><td>590.4360</td><td>1/15/2019</td><td>16:19</td><td>Cash       </td><td>562.32</td><td>4.761905</td><td>28.1160</td><td>4.5</td><td>Mandalay@Member@Sports and travel      </td></tr>\n",
       "\t<tr><td>506.6355</td><td>3/11/2019</td><td>11:03</td><td>Credit card</td><td>482.51</td><td>4.761905</td><td>24.1255</td><td>4.6</td><td>Yangon@Member@Health and beauty        </td></tr>\n",
       "\t<tr><td>457.4430</td><td>1/1/2019 </td><td>10:39</td><td>Credit card</td><td>435.66</td><td>4.761905</td><td>21.7830</td><td>6.9</td><td>Yangon@Normal@Sports and travel        </td></tr>\n",
       "\t<tr><td>172.2105</td><td>1/21/2019</td><td>18:00</td><td>Credit card</td><td>164.01</td><td>4.761905</td><td> 8.2005</td><td>8.6</td><td>Yangon@Normal@Food and beverages       </td></tr>\n",
       "\t<tr><td> 84.6300</td><td>3/11/2019</td><td>15:30</td><td>Ewallet    </td><td> 80.60</td><td>4.761905</td><td> 4.0300</td><td>4.4</td><td>Mandalay@Normal@Home and lifestyle     </td></tr>\n",
       "\t<tr><td>451.7100</td><td>2/25/2019</td><td>11:24</td><td>Ewallet    </td><td>430.20</td><td>4.761905</td><td>21.5100</td><td>4.8</td><td>Naypyitaw@Member@Electronic accessories</td></tr>\n",
       "\t<tr><td>277.1370</td><td>3/5/2019 </td><td>10:40</td><td>Ewallet    </td><td>263.94</td><td>4.761905</td><td>13.1970</td><td>5.1</td><td>Mandalay@Normal@Health and beauty      </td></tr>\n",
       "\t<tr><td> 69.7200</td><td>3/15/2019</td><td>12:20</td><td>Credit card</td><td> 66.40</td><td>4.761905</td><td> 3.3200</td><td>4.4</td><td>Mandalay@Normal@Home and lifestyle     </td></tr>\n",
       "\t<tr><td>181.4400</td><td>2/17/2019</td><td>11:15</td><td>Ewallet    </td><td>172.80</td><td>4.761905</td><td> 8.6400</td><td>9.9</td><td>Yangon@Normal@Electronic accessories   </td></tr>\n",
       "\t<tr><td>279.1845</td><td>3/2/2019 </td><td>17:36</td><td>Ewallet    </td><td>265.89</td><td>4.761905</td><td>13.2945</td><td>6.0</td><td>Yangon@Member@Sports and travel        </td></tr>\n",
       "\t<tr><td>441.7560</td><td>3/22/2019</td><td>19:20</td><td>Credit card</td><td>420.72</td><td>4.761905</td><td>21.0360</td><td>8.5</td><td>Yangon@Member@Home and lifestyle       </td></tr>\n",
       "\t<tr><td> 35.1960</td><td>2/8/2019 </td><td>15:31</td><td>Cash       </td><td> 33.52</td><td>4.761905</td><td> 1.6760</td><td>6.7</td><td>Mandalay@Normal@Fashion accessories    </td></tr>\n",
       "\t<tr><td>184.1070</td><td>3/10/2019</td><td>12:17</td><td>Credit card</td><td>175.34</td><td>4.761905</td><td> 8.7670</td><td>7.7</td><td>Yangon@Normal@Fashion accessories      </td></tr>\n",
       "\t<tr><td>463.8900</td><td>1/25/2019</td><td>19:48</td><td>Cash       </td><td>441.80</td><td>4.761905</td><td>22.0900</td><td>9.6</td><td>Mandalay@Normal@Food and beverages     </td></tr>\n",
       "\t<tr><td>235.2105</td><td>3/15/2019</td><td>15:36</td><td>Cash       </td><td>224.01</td><td>4.761905</td><td>11.2005</td><td>7.4</td><td>Yangon@Normal@Health and beauty        </td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td> 888.6150</td><td>1/1/2019 </td><td>11:36</td><td>Credit card</td><td>846.30</td><td>4.761905</td><td>42.3150</td><td>9.0</td><td>Mandalay@Member@Food and beverages     </td></tr>\n",
       "\t<tr><td> 271.2885</td><td>2/10/2019</td><td>13:51</td><td>Ewallet    </td><td>258.37</td><td>4.761905</td><td>12.9185</td><td>6.7</td><td>Mandalay@Member@Home and lifestyle     </td></tr>\n",
       "\t<tr><td> 640.0380</td><td>1/26/2019</td><td>15:17</td><td>Cash       </td><td>609.56</td><td>4.761905</td><td>30.4780</td><td>5.5</td><td>Mandalay@Normal@Electronic accessories </td></tr>\n",
       "\t<tr><td> 252.2520</td><td>2/11/2019</td><td>15:29</td><td>Cash       </td><td>240.24</td><td>4.761905</td><td>12.0120</td><td>5.4</td><td>Yangon@Normal@Home and lifestyle       </td></tr>\n",
       "\t<tr><td> 180.8730</td><td>2/7/2019 </td><td>17:59</td><td>Cash       </td><td>172.26</td><td>4.761905</td><td> 8.6130</td><td>8.2</td><td>Naypyitaw@Normal@Fashion accessories   </td></tr>\n",
       "\t<tr><td> 104.8320</td><td>3/6/2019 </td><td>11:55</td><td>Credit card</td><td> 99.84</td><td>4.761905</td><td> 4.9920</td><td>7.0</td><td>Mandalay@Member@Fashion accessories    </td></tr>\n",
       "\t<tr><td> 313.5720</td><td>3/4/2019 </td><td>10:39</td><td>Cash       </td><td>298.64</td><td>4.761905</td><td>14.9320</td><td>8.5</td><td>Yangon@Normal@Food and beverages       </td></tr>\n",
       "\t<tr><td> 167.5800</td><td>2/26/2019</td><td>15:10</td><td>Ewallet    </td><td>159.60</td><td>4.761905</td><td> 7.9800</td><td>4.9</td><td>Mandalay@Member@Food and beverages     </td></tr>\n",
       "\t<tr><td>  26.7225</td><td>3/10/2019</td><td>18:10</td><td>Credit card</td><td> 25.45</td><td>4.761905</td><td> 1.2725</td><td>5.1</td><td>Mandalay@Normal@Electronic accessories </td></tr>\n",
       "\t<tr><td>  71.1585</td><td>2/4/2019 </td><td>20:43</td><td>Credit card</td><td> 67.77</td><td>4.761905</td><td> 3.3885</td><td>6.5</td><td>Mandalay@Normal@Food and beverages     </td></tr>\n",
       "\t<tr><td> 250.2780</td><td>1/19/2019</td><td>12:46</td><td>Cash       </td><td>238.36</td><td>4.761905</td><td>11.9180</td><td>9.8</td><td>Naypyitaw@Member@Food and beverages    </td></tr>\n",
       "\t<tr><td> 244.2300</td><td>1/23/2019</td><td>17:44</td><td>Cash       </td><td>232.60</td><td>4.761905</td><td>11.6300</td><td>8.4</td><td>Yangon@Normal@Health and beauty        </td></tr>\n",
       "\t<tr><td> 921.1860</td><td>3/14/2019</td><td>14:19</td><td>Ewallet    </td><td>877.32</td><td>4.761905</td><td>43.8660</td><td>7.4</td><td>Yangon@Member@Sports and travel        </td></tr>\n",
       "\t<tr><td> 734.7060</td><td>1/23/2019</td><td>10:33</td><td>Cash       </td><td>699.72</td><td>4.761905</td><td>34.9860</td><td>6.1</td><td>Naypyitaw@Normal@Health and beauty     </td></tr>\n",
       "\t<tr><td> 708.3195</td><td>1/9/2019 </td><td>11:40</td><td>Cash       </td><td>674.59</td><td>4.761905</td><td>33.7295</td><td>6.0</td><td>Naypyitaw@Normal@Electronic accessories</td></tr>\n",
       "\t<tr><td> 334.4775</td><td>2/7/2019 </td><td>19:30</td><td>Ewallet    </td><td>318.55</td><td>4.761905</td><td>15.9275</td><td>8.5</td><td>Mandalay@Normal@Fashion accessories    </td></tr>\n",
       "\t<tr><td>  30.9960</td><td>2/18/2019</td><td>14:42</td><td>Ewallet    </td><td> 29.52</td><td>4.761905</td><td> 1.4760</td><td>4.3</td><td>Mandalay@Normal@Health and beauty      </td></tr>\n",
       "\t<tr><td> 520.8000</td><td>1/3/2019 </td><td>19:08</td><td>Credit card</td><td>496.00</td><td>4.761905</td><td>24.8000</td><td>6.2</td><td>Mandalay@Member@Health and beauty      </td></tr>\n",
       "\t<tr><td> 864.5700</td><td>3/29/2019</td><td>19:12</td><td>Ewallet    </td><td>823.40</td><td>4.761905</td><td>41.1700</td><td>4.3</td><td>Naypyitaw@Member@Electronic accessories</td></tr>\n",
       "\t<tr><td> 633.1080</td><td>1/28/2019</td><td>15:46</td><td>Credit card</td><td>602.96</td><td>4.761905</td><td>30.1480</td><td>8.4</td><td>Mandalay@Member@Health and beauty      </td></tr>\n",
       "\t<tr><td> 296.9400</td><td>3/22/2019</td><td>19:06</td><td>Credit card</td><td>282.80</td><td>4.761905</td><td>14.1400</td><td>4.5</td><td>Yangon@Normal@Food and beverages       </td></tr>\n",
       "\t<tr><td> 804.3000</td><td>1/24/2019</td><td>18:10</td><td>Ewallet    </td><td>766.00</td><td>4.761905</td><td>38.3000</td><td>6.0</td><td>Mandalay@Normal@Sports and travel      </td></tr>\n",
       "\t<tr><td> 121.8630</td><td>3/10/2019</td><td>20:46</td><td>Ewallet    </td><td>116.06</td><td>4.761905</td><td> 5.8030</td><td>8.8</td><td>Yangon@Normal@Electronic accessories   </td></tr>\n",
       "\t<tr><td> 183.6450</td><td>2/22/2019</td><td>18:35</td><td>Ewallet    </td><td>174.90</td><td>4.761905</td><td> 8.7450</td><td>6.6</td><td>Mandalay@Normal@Fashion accessories    </td></tr>\n",
       "\t<tr><td>  63.9975</td><td>2/18/2019</td><td>11:40</td><td>Ewallet    </td><td> 60.95</td><td>4.761905</td><td> 3.0475</td><td>5.9</td><td>Naypyitaw@Member@Electronic accessories</td></tr>\n",
       "\t<tr><td>  42.3675</td><td>1/29/2019</td><td>13:46</td><td>Ewallet    </td><td> 40.35</td><td>4.761905</td><td> 2.0175</td><td>6.2</td><td>Naypyitaw@Normal@Health and beauty     </td></tr>\n",
       "\t<tr><td>1022.4900</td><td>3/2/2019 </td><td>17:16</td><td>Ewallet    </td><td>973.80</td><td>4.761905</td><td>48.6900</td><td>4.4</td><td>Mandalay@Normal@Home and lifestyle     </td></tr>\n",
       "\t<tr><td>  33.4320</td><td>2/9/2019 </td><td>13:22</td><td>Cash       </td><td> 31.84</td><td>4.761905</td><td> 1.5920</td><td>7.7</td><td>Yangon@Member@Food and beverages       </td></tr>\n",
       "\t<tr><td>  69.1110</td><td>2/22/2019</td><td>15:33</td><td>Cash       </td><td> 65.82</td><td>4.761905</td><td> 3.2910</td><td>4.1</td><td>Yangon@Normal@Home and lifestyle       </td></tr>\n",
       "\t<tr><td> 649.2990</td><td>2/18/2019</td><td>13:28</td><td>Cash       </td><td>618.38</td><td>4.761905</td><td>30.9190</td><td>6.6</td><td>Yangon@Member@Fashion accessories      </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1000 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " Total & Date & Time & Payment & cogs & gross.margin.percentage & gross.income & Rating & dt\\$p3\\_key\\\\\n",
       " <dbl> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 548.9715 & 1/5/2019  & 13:08 & Ewallet     & 522.83 & 4.761905 & 26.1415 & 9.1 & Yangon@Member@Health and beauty        \\\\\n",
       "\t  80.2200 & 3/8/2019  & 10:29 & Cash        &  76.40 & 4.761905 &  3.8200 & 9.6 & Naypyitaw@Normal@Electronic accessories\\\\\n",
       "\t 340.5255 & 3/3/2019  & 13:23 & Credit card & 324.31 & 4.761905 & 16.2155 & 7.4 & Yangon@Normal@Home and lifestyle       \\\\\n",
       "\t 489.0480 & 1/27/2019 & 20:33 & Ewallet     & 465.76 & 4.761905 & 23.2880 & 8.4 & Yangon@Member@Health and beauty        \\\\\n",
       "\t 634.3785 & 2/8/2019  & 10:37 & Ewallet     & 604.17 & 4.761905 & 30.2085 & 5.3 & Yangon@Normal@Sports and travel        \\\\\n",
       "\t 627.6165 & 3/25/2019 & 18:30 & Ewallet     & 597.73 & 4.761905 & 29.8865 & 4.1 & Naypyitaw@Normal@Electronic accessories\\\\\n",
       "\t 433.6920 & 2/25/2019 & 14:36 & Ewallet     & 413.04 & 4.761905 & 20.6520 & 5.8 & Yangon@Member@Electronic accessories   \\\\\n",
       "\t 772.3800 & 2/24/2019 & 11:38 & Ewallet     & 735.60 & 4.761905 & 36.7800 & 8.0 & Naypyitaw@Normal@Home and lifestyle    \\\\\n",
       "\t  76.1460 & 1/10/2019 & 17:15 & Credit card &  72.52 & 4.761905 &  3.6260 & 7.2 & Yangon@Member@Health and beauty        \\\\\n",
       "\t 172.7460 & 2/20/2019 & 13:27 & Credit card & 164.52 & 4.761905 &  8.2260 & 5.9 & Mandalay@Member@Food and beverages     \\\\\n",
       "\t  60.8160 & 2/6/2019  & 18:07 & Ewallet     &  57.92 & 4.761905 &  2.8960 & 4.5 & Mandalay@Member@Fashion accessories    \\\\\n",
       "\t 107.1420 & 3/9/2019  & 17:03 & Cash        & 102.04 & 4.761905 &  5.1020 & 6.8 & Mandalay@Member@Electronic accessories \\\\\n",
       "\t 246.4875 & 2/12/2019 & 10:25 & Ewallet     & 234.75 & 4.761905 & 11.7375 & 7.1 & Yangon@Normal@Electronic accessories   \\\\\n",
       "\t 453.4950 & 2/7/2019  & 16:48 & Ewallet     & 431.90 & 4.761905 & 21.5950 & 8.2 & Yangon@Normal@Food and beverages       \\\\\n",
       "\t 749.4900 & 3/29/2019 & 19:21 & Cash        & 713.80 & 4.761905 & 35.6900 & 5.7 & Yangon@Normal@Health and beauty        \\\\\n",
       "\t 590.4360 & 1/15/2019 & 16:19 & Cash        & 562.32 & 4.761905 & 28.1160 & 4.5 & Mandalay@Member@Sports and travel      \\\\\n",
       "\t 506.6355 & 3/11/2019 & 11:03 & Credit card & 482.51 & 4.761905 & 24.1255 & 4.6 & Yangon@Member@Health and beauty        \\\\\n",
       "\t 457.4430 & 1/1/2019  & 10:39 & Credit card & 435.66 & 4.761905 & 21.7830 & 6.9 & Yangon@Normal@Sports and travel        \\\\\n",
       "\t 172.2105 & 1/21/2019 & 18:00 & Credit card & 164.01 & 4.761905 &  8.2005 & 8.6 & Yangon@Normal@Food and beverages       \\\\\n",
       "\t  84.6300 & 3/11/2019 & 15:30 & Ewallet     &  80.60 & 4.761905 &  4.0300 & 4.4 & Mandalay@Normal@Home and lifestyle     \\\\\n",
       "\t 451.7100 & 2/25/2019 & 11:24 & Ewallet     & 430.20 & 4.761905 & 21.5100 & 4.8 & Naypyitaw@Member@Electronic accessories\\\\\n",
       "\t 277.1370 & 3/5/2019  & 10:40 & Ewallet     & 263.94 & 4.761905 & 13.1970 & 5.1 & Mandalay@Normal@Health and beauty      \\\\\n",
       "\t  69.7200 & 3/15/2019 & 12:20 & Credit card &  66.40 & 4.761905 &  3.3200 & 4.4 & Mandalay@Normal@Home and lifestyle     \\\\\n",
       "\t 181.4400 & 2/17/2019 & 11:15 & Ewallet     & 172.80 & 4.761905 &  8.6400 & 9.9 & Yangon@Normal@Electronic accessories   \\\\\n",
       "\t 279.1845 & 3/2/2019  & 17:36 & Ewallet     & 265.89 & 4.761905 & 13.2945 & 6.0 & Yangon@Member@Sports and travel        \\\\\n",
       "\t 441.7560 & 3/22/2019 & 19:20 & Credit card & 420.72 & 4.761905 & 21.0360 & 8.5 & Yangon@Member@Home and lifestyle       \\\\\n",
       "\t  35.1960 & 2/8/2019  & 15:31 & Cash        &  33.52 & 4.761905 &  1.6760 & 6.7 & Mandalay@Normal@Fashion accessories    \\\\\n",
       "\t 184.1070 & 3/10/2019 & 12:17 & Credit card & 175.34 & 4.761905 &  8.7670 & 7.7 & Yangon@Normal@Fashion accessories      \\\\\n",
       "\t 463.8900 & 1/25/2019 & 19:48 & Cash        & 441.80 & 4.761905 & 22.0900 & 9.6 & Mandalay@Normal@Food and beverages     \\\\\n",
       "\t 235.2105 & 3/15/2019 & 15:36 & Cash        & 224.01 & 4.761905 & 11.2005 & 7.4 & Yangon@Normal@Health and beauty        \\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t  888.6150 & 1/1/2019  & 11:36 & Credit card & 846.30 & 4.761905 & 42.3150 & 9.0 & Mandalay@Member@Food and beverages     \\\\\n",
       "\t  271.2885 & 2/10/2019 & 13:51 & Ewallet     & 258.37 & 4.761905 & 12.9185 & 6.7 & Mandalay@Member@Home and lifestyle     \\\\\n",
       "\t  640.0380 & 1/26/2019 & 15:17 & Cash        & 609.56 & 4.761905 & 30.4780 & 5.5 & Mandalay@Normal@Electronic accessories \\\\\n",
       "\t  252.2520 & 2/11/2019 & 15:29 & Cash        & 240.24 & 4.761905 & 12.0120 & 5.4 & Yangon@Normal@Home and lifestyle       \\\\\n",
       "\t  180.8730 & 2/7/2019  & 17:59 & Cash        & 172.26 & 4.761905 &  8.6130 & 8.2 & Naypyitaw@Normal@Fashion accessories   \\\\\n",
       "\t  104.8320 & 3/6/2019  & 11:55 & Credit card &  99.84 & 4.761905 &  4.9920 & 7.0 & Mandalay@Member@Fashion accessories    \\\\\n",
       "\t  313.5720 & 3/4/2019  & 10:39 & Cash        & 298.64 & 4.761905 & 14.9320 & 8.5 & Yangon@Normal@Food and beverages       \\\\\n",
       "\t  167.5800 & 2/26/2019 & 15:10 & Ewallet     & 159.60 & 4.761905 &  7.9800 & 4.9 & Mandalay@Member@Food and beverages     \\\\\n",
       "\t   26.7225 & 3/10/2019 & 18:10 & Credit card &  25.45 & 4.761905 &  1.2725 & 5.1 & Mandalay@Normal@Electronic accessories \\\\\n",
       "\t   71.1585 & 2/4/2019  & 20:43 & Credit card &  67.77 & 4.761905 &  3.3885 & 6.5 & Mandalay@Normal@Food and beverages     \\\\\n",
       "\t  250.2780 & 1/19/2019 & 12:46 & Cash        & 238.36 & 4.761905 & 11.9180 & 9.8 & Naypyitaw@Member@Food and beverages    \\\\\n",
       "\t  244.2300 & 1/23/2019 & 17:44 & Cash        & 232.60 & 4.761905 & 11.6300 & 8.4 & Yangon@Normal@Health and beauty        \\\\\n",
       "\t  921.1860 & 3/14/2019 & 14:19 & Ewallet     & 877.32 & 4.761905 & 43.8660 & 7.4 & Yangon@Member@Sports and travel        \\\\\n",
       "\t  734.7060 & 1/23/2019 & 10:33 & Cash        & 699.72 & 4.761905 & 34.9860 & 6.1 & Naypyitaw@Normal@Health and beauty     \\\\\n",
       "\t  708.3195 & 1/9/2019  & 11:40 & Cash        & 674.59 & 4.761905 & 33.7295 & 6.0 & Naypyitaw@Normal@Electronic accessories\\\\\n",
       "\t  334.4775 & 2/7/2019  & 19:30 & Ewallet     & 318.55 & 4.761905 & 15.9275 & 8.5 & Mandalay@Normal@Fashion accessories    \\\\\n",
       "\t   30.9960 & 2/18/2019 & 14:42 & Ewallet     &  29.52 & 4.761905 &  1.4760 & 4.3 & Mandalay@Normal@Health and beauty      \\\\\n",
       "\t  520.8000 & 1/3/2019  & 19:08 & Credit card & 496.00 & 4.761905 & 24.8000 & 6.2 & Mandalay@Member@Health and beauty      \\\\\n",
       "\t  864.5700 & 3/29/2019 & 19:12 & Ewallet     & 823.40 & 4.761905 & 41.1700 & 4.3 & Naypyitaw@Member@Electronic accessories\\\\\n",
       "\t  633.1080 & 1/28/2019 & 15:46 & Credit card & 602.96 & 4.761905 & 30.1480 & 8.4 & Mandalay@Member@Health and beauty      \\\\\n",
       "\t  296.9400 & 3/22/2019 & 19:06 & Credit card & 282.80 & 4.761905 & 14.1400 & 4.5 & Yangon@Normal@Food and beverages       \\\\\n",
       "\t  804.3000 & 1/24/2019 & 18:10 & Ewallet     & 766.00 & 4.761905 & 38.3000 & 6.0 & Mandalay@Normal@Sports and travel      \\\\\n",
       "\t  121.8630 & 3/10/2019 & 20:46 & Ewallet     & 116.06 & 4.761905 &  5.8030 & 8.8 & Yangon@Normal@Electronic accessories   \\\\\n",
       "\t  183.6450 & 2/22/2019 & 18:35 & Ewallet     & 174.90 & 4.761905 &  8.7450 & 6.6 & Mandalay@Normal@Fashion accessories    \\\\\n",
       "\t   63.9975 & 2/18/2019 & 11:40 & Ewallet     &  60.95 & 4.761905 &  3.0475 & 5.9 & Naypyitaw@Member@Electronic accessories\\\\\n",
       "\t   42.3675 & 1/29/2019 & 13:46 & Ewallet     &  40.35 & 4.761905 &  2.0175 & 6.2 & Naypyitaw@Normal@Health and beauty     \\\\\n",
       "\t 1022.4900 & 3/2/2019  & 17:16 & Ewallet     & 973.80 & 4.761905 & 48.6900 & 4.4 & Mandalay@Normal@Home and lifestyle     \\\\\n",
       "\t   33.4320 & 2/9/2019  & 13:22 & Cash        &  31.84 & 4.761905 &  1.5920 & 7.7 & Yangon@Member@Food and beverages       \\\\\n",
       "\t   69.1110 & 2/22/2019 & 15:33 & Cash        &  65.82 & 4.761905 &  3.2910 & 4.1 & Yangon@Normal@Home and lifestyle       \\\\\n",
       "\t  649.2990 & 2/18/2019 & 13:28 & Cash        & 618.38 & 4.761905 & 30.9190 & 6.6 & Yangon@Member@Fashion accessories      \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1000 × 9\n",
       "\n",
       "| Total &lt;dbl&gt; | Date &lt;chr&gt; | Time &lt;chr&gt; | Payment &lt;chr&gt; | cogs &lt;dbl&gt; | gross.margin.percentage &lt;dbl&gt; | gross.income &lt;dbl&gt; | Rating &lt;dbl&gt; | dt$p3_key &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 548.9715 | 1/5/2019  | 13:08 | Ewallet     | 522.83 | 4.761905 | 26.1415 | 9.1 | Yangon@Member@Health and beauty         |\n",
       "|  80.2200 | 3/8/2019  | 10:29 | Cash        |  76.40 | 4.761905 |  3.8200 | 9.6 | Naypyitaw@Normal@Electronic accessories |\n",
       "| 340.5255 | 3/3/2019  | 13:23 | Credit card | 324.31 | 4.761905 | 16.2155 | 7.4 | Yangon@Normal@Home and lifestyle        |\n",
       "| 489.0480 | 1/27/2019 | 20:33 | Ewallet     | 465.76 | 4.761905 | 23.2880 | 8.4 | Yangon@Member@Health and beauty         |\n",
       "| 634.3785 | 2/8/2019  | 10:37 | Ewallet     | 604.17 | 4.761905 | 30.2085 | 5.3 | Yangon@Normal@Sports and travel         |\n",
       "| 627.6165 | 3/25/2019 | 18:30 | Ewallet     | 597.73 | 4.761905 | 29.8865 | 4.1 | Naypyitaw@Normal@Electronic accessories |\n",
       "| 433.6920 | 2/25/2019 | 14:36 | Ewallet     | 413.04 | 4.761905 | 20.6520 | 5.8 | Yangon@Member@Electronic accessories    |\n",
       "| 772.3800 | 2/24/2019 | 11:38 | Ewallet     | 735.60 | 4.761905 | 36.7800 | 8.0 | Naypyitaw@Normal@Home and lifestyle     |\n",
       "|  76.1460 | 1/10/2019 | 17:15 | Credit card |  72.52 | 4.761905 |  3.6260 | 7.2 | Yangon@Member@Health and beauty         |\n",
       "| 172.7460 | 2/20/2019 | 13:27 | Credit card | 164.52 | 4.761905 |  8.2260 | 5.9 | Mandalay@Member@Food and beverages      |\n",
       "|  60.8160 | 2/6/2019  | 18:07 | Ewallet     |  57.92 | 4.761905 |  2.8960 | 4.5 | Mandalay@Member@Fashion accessories     |\n",
       "| 107.1420 | 3/9/2019  | 17:03 | Cash        | 102.04 | 4.761905 |  5.1020 | 6.8 | Mandalay@Member@Electronic accessories  |\n",
       "| 246.4875 | 2/12/2019 | 10:25 | Ewallet     | 234.75 | 4.761905 | 11.7375 | 7.1 | Yangon@Normal@Electronic accessories    |\n",
       "| 453.4950 | 2/7/2019  | 16:48 | Ewallet     | 431.90 | 4.761905 | 21.5950 | 8.2 | Yangon@Normal@Food and beverages        |\n",
       "| 749.4900 | 3/29/2019 | 19:21 | Cash        | 713.80 | 4.761905 | 35.6900 | 5.7 | Yangon@Normal@Health and beauty         |\n",
       "| 590.4360 | 1/15/2019 | 16:19 | Cash        | 562.32 | 4.761905 | 28.1160 | 4.5 | Mandalay@Member@Sports and travel       |\n",
       "| 506.6355 | 3/11/2019 | 11:03 | Credit card | 482.51 | 4.761905 | 24.1255 | 4.6 | Yangon@Member@Health and beauty         |\n",
       "| 457.4430 | 1/1/2019  | 10:39 | Credit card | 435.66 | 4.761905 | 21.7830 | 6.9 | Yangon@Normal@Sports and travel         |\n",
       "| 172.2105 | 1/21/2019 | 18:00 | Credit card | 164.01 | 4.761905 |  8.2005 | 8.6 | Yangon@Normal@Food and beverages        |\n",
       "|  84.6300 | 3/11/2019 | 15:30 | Ewallet     |  80.60 | 4.761905 |  4.0300 | 4.4 | Mandalay@Normal@Home and lifestyle      |\n",
       "| 451.7100 | 2/25/2019 | 11:24 | Ewallet     | 430.20 | 4.761905 | 21.5100 | 4.8 | Naypyitaw@Member@Electronic accessories |\n",
       "| 277.1370 | 3/5/2019  | 10:40 | Ewallet     | 263.94 | 4.761905 | 13.1970 | 5.1 | Mandalay@Normal@Health and beauty       |\n",
       "|  69.7200 | 3/15/2019 | 12:20 | Credit card |  66.40 | 4.761905 |  3.3200 | 4.4 | Mandalay@Normal@Home and lifestyle      |\n",
       "| 181.4400 | 2/17/2019 | 11:15 | Ewallet     | 172.80 | 4.761905 |  8.6400 | 9.9 | Yangon@Normal@Electronic accessories    |\n",
       "| 279.1845 | 3/2/2019  | 17:36 | Ewallet     | 265.89 | 4.761905 | 13.2945 | 6.0 | Yangon@Member@Sports and travel         |\n",
       "| 441.7560 | 3/22/2019 | 19:20 | Credit card | 420.72 | 4.761905 | 21.0360 | 8.5 | Yangon@Member@Home and lifestyle        |\n",
       "|  35.1960 | 2/8/2019  | 15:31 | Cash        |  33.52 | 4.761905 |  1.6760 | 6.7 | Mandalay@Normal@Fashion accessories     |\n",
       "| 184.1070 | 3/10/2019 | 12:17 | Credit card | 175.34 | 4.761905 |  8.7670 | 7.7 | Yangon@Normal@Fashion accessories       |\n",
       "| 463.8900 | 1/25/2019 | 19:48 | Cash        | 441.80 | 4.761905 | 22.0900 | 9.6 | Mandalay@Normal@Food and beverages      |\n",
       "| 235.2105 | 3/15/2019 | 15:36 | Cash        | 224.01 | 4.761905 | 11.2005 | 7.4 | Yangon@Normal@Health and beauty         |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "|  888.6150 | 1/1/2019  | 11:36 | Credit card | 846.30 | 4.761905 | 42.3150 | 9.0 | Mandalay@Member@Food and beverages      |\n",
       "|  271.2885 | 2/10/2019 | 13:51 | Ewallet     | 258.37 | 4.761905 | 12.9185 | 6.7 | Mandalay@Member@Home and lifestyle      |\n",
       "|  640.0380 | 1/26/2019 | 15:17 | Cash        | 609.56 | 4.761905 | 30.4780 | 5.5 | Mandalay@Normal@Electronic accessories  |\n",
       "|  252.2520 | 2/11/2019 | 15:29 | Cash        | 240.24 | 4.761905 | 12.0120 | 5.4 | Yangon@Normal@Home and lifestyle        |\n",
       "|  180.8730 | 2/7/2019  | 17:59 | Cash        | 172.26 | 4.761905 |  8.6130 | 8.2 | Naypyitaw@Normal@Fashion accessories    |\n",
       "|  104.8320 | 3/6/2019  | 11:55 | Credit card |  99.84 | 4.761905 |  4.9920 | 7.0 | Mandalay@Member@Fashion accessories     |\n",
       "|  313.5720 | 3/4/2019  | 10:39 | Cash        | 298.64 | 4.761905 | 14.9320 | 8.5 | Yangon@Normal@Food and beverages        |\n",
       "|  167.5800 | 2/26/2019 | 15:10 | Ewallet     | 159.60 | 4.761905 |  7.9800 | 4.9 | Mandalay@Member@Food and beverages      |\n",
       "|   26.7225 | 3/10/2019 | 18:10 | Credit card |  25.45 | 4.761905 |  1.2725 | 5.1 | Mandalay@Normal@Electronic accessories  |\n",
       "|   71.1585 | 2/4/2019  | 20:43 | Credit card |  67.77 | 4.761905 |  3.3885 | 6.5 | Mandalay@Normal@Food and beverages      |\n",
       "|  250.2780 | 1/19/2019 | 12:46 | Cash        | 238.36 | 4.761905 | 11.9180 | 9.8 | Naypyitaw@Member@Food and beverages     |\n",
       "|  244.2300 | 1/23/2019 | 17:44 | Cash        | 232.60 | 4.761905 | 11.6300 | 8.4 | Yangon@Normal@Health and beauty         |\n",
       "|  921.1860 | 3/14/2019 | 14:19 | Ewallet     | 877.32 | 4.761905 | 43.8660 | 7.4 | Yangon@Member@Sports and travel         |\n",
       "|  734.7060 | 1/23/2019 | 10:33 | Cash        | 699.72 | 4.761905 | 34.9860 | 6.1 | Naypyitaw@Normal@Health and beauty      |\n",
       "|  708.3195 | 1/9/2019  | 11:40 | Cash        | 674.59 | 4.761905 | 33.7295 | 6.0 | Naypyitaw@Normal@Electronic accessories |\n",
       "|  334.4775 | 2/7/2019  | 19:30 | Ewallet     | 318.55 | 4.761905 | 15.9275 | 8.5 | Mandalay@Normal@Fashion accessories     |\n",
       "|   30.9960 | 2/18/2019 | 14:42 | Ewallet     |  29.52 | 4.761905 |  1.4760 | 4.3 | Mandalay@Normal@Health and beauty       |\n",
       "|  520.8000 | 1/3/2019  | 19:08 | Credit card | 496.00 | 4.761905 | 24.8000 | 6.2 | Mandalay@Member@Health and beauty       |\n",
       "|  864.5700 | 3/29/2019 | 19:12 | Ewallet     | 823.40 | 4.761905 | 41.1700 | 4.3 | Naypyitaw@Member@Electronic accessories |\n",
       "|  633.1080 | 1/28/2019 | 15:46 | Credit card | 602.96 | 4.761905 | 30.1480 | 8.4 | Mandalay@Member@Health and beauty       |\n",
       "|  296.9400 | 3/22/2019 | 19:06 | Credit card | 282.80 | 4.761905 | 14.1400 | 4.5 | Yangon@Normal@Food and beverages        |\n",
       "|  804.3000 | 1/24/2019 | 18:10 | Ewallet     | 766.00 | 4.761905 | 38.3000 | 6.0 | Mandalay@Normal@Sports and travel       |\n",
       "|  121.8630 | 3/10/2019 | 20:46 | Ewallet     | 116.06 | 4.761905 |  5.8030 | 8.8 | Yangon@Normal@Electronic accessories    |\n",
       "|  183.6450 | 2/22/2019 | 18:35 | Ewallet     | 174.90 | 4.761905 |  8.7450 | 6.6 | Mandalay@Normal@Fashion accessories     |\n",
       "|   63.9975 | 2/18/2019 | 11:40 | Ewallet     |  60.95 | 4.761905 |  3.0475 | 5.9 | Naypyitaw@Member@Electronic accessories |\n",
       "|   42.3675 | 1/29/2019 | 13:46 | Ewallet     |  40.35 | 4.761905 |  2.0175 | 6.2 | Naypyitaw@Normal@Health and beauty      |\n",
       "| 1022.4900 | 3/2/2019  | 17:16 | Ewallet     | 973.80 | 4.761905 | 48.6900 | 4.4 | Mandalay@Normal@Home and lifestyle      |\n",
       "|   33.4320 | 2/9/2019  | 13:22 | Cash        |  31.84 | 4.761905 |  1.5920 | 7.7 | Yangon@Member@Food and beverages        |\n",
       "|   69.1110 | 2/22/2019 | 15:33 | Cash        |  65.82 | 4.761905 |  3.2910 | 4.1 | Yangon@Normal@Home and lifestyle        |\n",
       "|  649.2990 | 2/18/2019 | 13:28 | Cash        | 618.38 | 4.761905 | 30.9190 | 6.6 | Yangon@Member@Fashion accessories       |\n",
       "\n"
      ],
      "text/plain": [
       "     Total     Date      Time  Payment     cogs   gross.margin.percentage\n",
       "1    548.9715  1/5/2019  13:08 Ewallet     522.83 4.761905               \n",
       "2     80.2200  3/8/2019  10:29 Cash         76.40 4.761905               \n",
       "3    340.5255  3/3/2019  13:23 Credit card 324.31 4.761905               \n",
       "4    489.0480  1/27/2019 20:33 Ewallet     465.76 4.761905               \n",
       "5    634.3785  2/8/2019  10:37 Ewallet     604.17 4.761905               \n",
       "6    627.6165  3/25/2019 18:30 Ewallet     597.73 4.761905               \n",
       "7    433.6920  2/25/2019 14:36 Ewallet     413.04 4.761905               \n",
       "8    772.3800  2/24/2019 11:38 Ewallet     735.60 4.761905               \n",
       "9     76.1460  1/10/2019 17:15 Credit card  72.52 4.761905               \n",
       "10   172.7460  2/20/2019 13:27 Credit card 164.52 4.761905               \n",
       "11    60.8160  2/6/2019  18:07 Ewallet      57.92 4.761905               \n",
       "12   107.1420  3/9/2019  17:03 Cash        102.04 4.761905               \n",
       "13   246.4875  2/12/2019 10:25 Ewallet     234.75 4.761905               \n",
       "14   453.4950  2/7/2019  16:48 Ewallet     431.90 4.761905               \n",
       "15   749.4900  3/29/2019 19:21 Cash        713.80 4.761905               \n",
       "16   590.4360  1/15/2019 16:19 Cash        562.32 4.761905               \n",
       "17   506.6355  3/11/2019 11:03 Credit card 482.51 4.761905               \n",
       "18   457.4430  1/1/2019  10:39 Credit card 435.66 4.761905               \n",
       "19   172.2105  1/21/2019 18:00 Credit card 164.01 4.761905               \n",
       "20    84.6300  3/11/2019 15:30 Ewallet      80.60 4.761905               \n",
       "21   451.7100  2/25/2019 11:24 Ewallet     430.20 4.761905               \n",
       "22   277.1370  3/5/2019  10:40 Ewallet     263.94 4.761905               \n",
       "23    69.7200  3/15/2019 12:20 Credit card  66.40 4.761905               \n",
       "24   181.4400  2/17/2019 11:15 Ewallet     172.80 4.761905               \n",
       "25   279.1845  3/2/2019  17:36 Ewallet     265.89 4.761905               \n",
       "26   441.7560  3/22/2019 19:20 Credit card 420.72 4.761905               \n",
       "27    35.1960  2/8/2019  15:31 Cash         33.52 4.761905               \n",
       "28   184.1070  3/10/2019 12:17 Credit card 175.34 4.761905               \n",
       "29   463.8900  1/25/2019 19:48 Cash        441.80 4.761905               \n",
       "30   235.2105  3/15/2019 15:36 Cash        224.01 4.761905               \n",
       "⋮    ⋮         ⋮         ⋮     ⋮           ⋮      ⋮                      \n",
       "971   888.6150 1/1/2019  11:36 Credit card 846.30 4.761905               \n",
       "972   271.2885 2/10/2019 13:51 Ewallet     258.37 4.761905               \n",
       "973   640.0380 1/26/2019 15:17 Cash        609.56 4.761905               \n",
       "974   252.2520 2/11/2019 15:29 Cash        240.24 4.761905               \n",
       "975   180.8730 2/7/2019  17:59 Cash        172.26 4.761905               \n",
       "976   104.8320 3/6/2019  11:55 Credit card  99.84 4.761905               \n",
       "977   313.5720 3/4/2019  10:39 Cash        298.64 4.761905               \n",
       "978   167.5800 2/26/2019 15:10 Ewallet     159.60 4.761905               \n",
       "979    26.7225 3/10/2019 18:10 Credit card  25.45 4.761905               \n",
       "980    71.1585 2/4/2019  20:43 Credit card  67.77 4.761905               \n",
       "981   250.2780 1/19/2019 12:46 Cash        238.36 4.761905               \n",
       "982   244.2300 1/23/2019 17:44 Cash        232.60 4.761905               \n",
       "983   921.1860 3/14/2019 14:19 Ewallet     877.32 4.761905               \n",
       "984   734.7060 1/23/2019 10:33 Cash        699.72 4.761905               \n",
       "985   708.3195 1/9/2019  11:40 Cash        674.59 4.761905               \n",
       "986   334.4775 2/7/2019  19:30 Ewallet     318.55 4.761905               \n",
       "987    30.9960 2/18/2019 14:42 Ewallet      29.52 4.761905               \n",
       "988   520.8000 1/3/2019  19:08 Credit card 496.00 4.761905               \n",
       "989   864.5700 3/29/2019 19:12 Ewallet     823.40 4.761905               \n",
       "990   633.1080 1/28/2019 15:46 Credit card 602.96 4.761905               \n",
       "991   296.9400 3/22/2019 19:06 Credit card 282.80 4.761905               \n",
       "992   804.3000 1/24/2019 18:10 Ewallet     766.00 4.761905               \n",
       "993   121.8630 3/10/2019 20:46 Ewallet     116.06 4.761905               \n",
       "994   183.6450 2/22/2019 18:35 Ewallet     174.90 4.761905               \n",
       "995    63.9975 2/18/2019 11:40 Ewallet      60.95 4.761905               \n",
       "996    42.3675 1/29/2019 13:46 Ewallet      40.35 4.761905               \n",
       "997  1022.4900 3/2/2019  17:16 Ewallet     973.80 4.761905               \n",
       "998    33.4320 2/9/2019  13:22 Cash         31.84 4.761905               \n",
       "999    69.1110 2/22/2019 15:33 Cash         65.82 4.761905               \n",
       "1000  649.2990 2/18/2019 13:28 Cash        618.38 4.761905               \n",
       "     gross.income Rating dt$p3_key                              \n",
       "1    26.1415      9.1    Yangon@Member@Health and beauty        \n",
       "2     3.8200      9.6    Naypyitaw@Normal@Electronic accessories\n",
       "3    16.2155      7.4    Yangon@Normal@Home and lifestyle       \n",
       "4    23.2880      8.4    Yangon@Member@Health and beauty        \n",
       "5    30.2085      5.3    Yangon@Normal@Sports and travel        \n",
       "6    29.8865      4.1    Naypyitaw@Normal@Electronic accessories\n",
       "7    20.6520      5.8    Yangon@Member@Electronic accessories   \n",
       "8    36.7800      8.0    Naypyitaw@Normal@Home and lifestyle    \n",
       "9     3.6260      7.2    Yangon@Member@Health and beauty        \n",
       "10    8.2260      5.9    Mandalay@Member@Food and beverages     \n",
       "11    2.8960      4.5    Mandalay@Member@Fashion accessories    \n",
       "12    5.1020      6.8    Mandalay@Member@Electronic accessories \n",
       "13   11.7375      7.1    Yangon@Normal@Electronic accessories   \n",
       "14   21.5950      8.2    Yangon@Normal@Food and beverages       \n",
       "15   35.6900      5.7    Yangon@Normal@Health and beauty        \n",
       "16   28.1160      4.5    Mandalay@Member@Sports and travel      \n",
       "17   24.1255      4.6    Yangon@Member@Health and beauty        \n",
       "18   21.7830      6.9    Yangon@Normal@Sports and travel        \n",
       "19    8.2005      8.6    Yangon@Normal@Food and beverages       \n",
       "20    4.0300      4.4    Mandalay@Normal@Home and lifestyle     \n",
       "21   21.5100      4.8    Naypyitaw@Member@Electronic accessories\n",
       "22   13.1970      5.1    Mandalay@Normal@Health and beauty      \n",
       "23    3.3200      4.4    Mandalay@Normal@Home and lifestyle     \n",
       "24    8.6400      9.9    Yangon@Normal@Electronic accessories   \n",
       "25   13.2945      6.0    Yangon@Member@Sports and travel        \n",
       "26   21.0360      8.5    Yangon@Member@Home and lifestyle       \n",
       "27    1.6760      6.7    Mandalay@Normal@Fashion accessories    \n",
       "28    8.7670      7.7    Yangon@Normal@Fashion accessories      \n",
       "29   22.0900      9.6    Mandalay@Normal@Food and beverages     \n",
       "30   11.2005      7.4    Yangon@Normal@Health and beauty        \n",
       "⋮    ⋮            ⋮      ⋮                                      \n",
       "971  42.3150      9.0    Mandalay@Member@Food and beverages     \n",
       "972  12.9185      6.7    Mandalay@Member@Home and lifestyle     \n",
       "973  30.4780      5.5    Mandalay@Normal@Electronic accessories \n",
       "974  12.0120      5.4    Yangon@Normal@Home and lifestyle       \n",
       "975   8.6130      8.2    Naypyitaw@Normal@Fashion accessories   \n",
       "976   4.9920      7.0    Mandalay@Member@Fashion accessories    \n",
       "977  14.9320      8.5    Yangon@Normal@Food and beverages       \n",
       "978   7.9800      4.9    Mandalay@Member@Food and beverages     \n",
       "979   1.2725      5.1    Mandalay@Normal@Electronic accessories \n",
       "980   3.3885      6.5    Mandalay@Normal@Food and beverages     \n",
       "981  11.9180      9.8    Naypyitaw@Member@Food and beverages    \n",
       "982  11.6300      8.4    Yangon@Normal@Health and beauty        \n",
       "983  43.8660      7.4    Yangon@Member@Sports and travel        \n",
       "984  34.9860      6.1    Naypyitaw@Normal@Health and beauty     \n",
       "985  33.7295      6.0    Naypyitaw@Normal@Electronic accessories\n",
       "986  15.9275      8.5    Mandalay@Normal@Fashion accessories    \n",
       "987   1.4760      4.3    Mandalay@Normal@Health and beauty      \n",
       "988  24.8000      6.2    Mandalay@Member@Health and beauty      \n",
       "989  41.1700      4.3    Naypyitaw@Member@Electronic accessories\n",
       "990  30.1480      8.4    Mandalay@Member@Health and beauty      \n",
       "991  14.1400      4.5    Yangon@Normal@Food and beverages       \n",
       "992  38.3000      6.0    Mandalay@Normal@Sports and travel      \n",
       "993   5.8030      8.8    Yangon@Normal@Electronic accessories   \n",
       "994   8.7450      6.6    Mandalay@Normal@Fashion accessories    \n",
       "995   3.0475      5.9    Naypyitaw@Member@Electronic accessories\n",
       "996   2.0175      6.2    Naypyitaw@Normal@Health and beauty     \n",
       "997  48.6900      4.4    Mandalay@Normal@Home and lifestyle     \n",
       "998   1.5920      7.7    Yangon@Member@Food and beverages       \n",
       "999   3.2910      4.1    Yangon@Normal@Home and lifestyle       \n",
       "1000 30.9190      6.6    Yangon@Member@Fashion accessories      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "exceptionDF"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "cc9e7e7f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.516337Z",
     "iopub.status.busy": "2023-07-10T12:57:11.514812Z",
     "iopub.status.idle": "2023-07-10T12:57:11.533790Z",
     "shell.execute_reply": "2023-07-10T12:57:11.532070Z"
    },
    "papermill": {
     "duration": 0.029069,
     "end_time": "2023-07-10T12:57:11.536166",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.507097",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Matching p3 in f5 and exception df to get abc class in f5\n",
    "exceptionDF <- select(exceptionDF,'dt$p3_key', 'Rating')\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "9ad4d0b5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.551244Z",
     "iopub.status.busy": "2023-07-10T12:57:11.549519Z",
     "iopub.status.idle": "2023-07-10T12:57:11.569339Z",
     "shell.execute_reply": "2023-07-10T12:57:11.567074Z"
    },
    "papermill": {
     "duration": 0.029815,
     "end_time": "2023-07-10T12:57:11.571699",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.541884",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Branch'</li><li>'City'</li><li>'Customer.type'</li><li>'Gender'</li><li>'Total'</li><li>'Date'</li><li>'Time'</li><li>'p2_key'</li><li>'Product.line'</li><li>'Unit.price'</li><li>'Quantity'</li><li>'Tax.5.'</li><li>'p3_key'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Branch'\n",
       "\\item 'City'\n",
       "\\item 'Customer.type'\n",
       "\\item 'Gender'\n",
       "\\item 'Total'\n",
       "\\item 'Date'\n",
       "\\item 'Time'\n",
       "\\item 'p2\\_key'\n",
       "\\item 'Product.line'\n",
       "\\item 'Unit.price'\n",
       "\\item 'Quantity'\n",
       "\\item 'Tax.5.'\n",
       "\\item 'p3\\_key'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Branch'\n",
       "2. 'City'\n",
       "3. 'Customer.type'\n",
       "4. 'Gender'\n",
       "5. 'Total'\n",
       "6. 'Date'\n",
       "7. 'Time'\n",
       "8. 'p2_key'\n",
       "9. 'Product.line'\n",
       "10. 'Unit.price'\n",
       "11. 'Quantity'\n",
       "12. 'Tax.5.'\n",
       "13. 'p3_key'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Branch\"        \"City\"          \"Customer.type\" \"Gender\"       \n",
       " [5] \"Total\"         \"Date\"          \"Time\"          \"p2_key\"       \n",
       " [9] \"Product.line\"  \"Unit.price\"    \"Quantity\"      \"Tax.5.\"       \n",
       "[13] \"p3_key\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(dt)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "6418365a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.592878Z",
     "iopub.status.busy": "2023-07-10T12:57:11.585473Z",
     "iopub.status.idle": "2023-07-10T12:57:11.611378Z",
     "shell.execute_reply": "2023-07-10T12:57:11.609175Z"
    },
    "papermill": {
     "duration": 0.036803,
     "end_time": "2023-07-10T12:57:11.614446",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.577643",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'dt$p3_key'</li><li>'Rating'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'dt\\$p3\\_key'\n",
       "\\item 'Rating'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'dt$p3_key'\n",
       "2. 'Rating'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"dt$p3_key\" \"Rating\"   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(exceptionDF)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "2a469a53",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.630945Z",
     "iopub.status.busy": "2023-07-10T12:57:11.629380Z",
     "iopub.status.idle": "2023-07-10T12:57:11.652857Z",
     "shell.execute_reply": "2023-07-10T12:57:11.650994Z"
    },
    "papermill": {
     "duration": 0.035234,
     "end_time": "2023-07-10T12:57:11.655955",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.620721",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "colnames(exceptionDF)[1] <-\"p3_key\"\n",
    "newdf <- left_join(dt,exceptionDF,by=c('p3_key'),relationship =\n",
    "  \"many-to-many\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "eda613d9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.671842Z",
     "iopub.status.busy": "2023-07-10T12:57:11.669913Z",
     "iopub.status.idle": "2023-07-10T12:57:11.683859Z",
     "shell.execute_reply": "2023-07-10T12:57:11.682105Z"
    },
    "papermill": {
     "duration": 0.025012,
     "end_time": "2023-07-10T12:57:11.686976",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.661964",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#salesMaster = salesMaster %>% select(col_names)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "f6e40aa0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-10T12:57:11.703121Z",
     "iopub.status.busy": "2023-07-10T12:57:11.701326Z",
     "iopub.status.idle": "2023-07-10T12:57:11.736386Z",
     "shell.execute_reply": "2023-07-10T12:57:11.734356Z"
    },
    "papermill": {
     "duration": 0.046552,
     "end_time": "2023-07-10T12:57:11.739656",
     "exception": false,
     "start_time": "2023-07-10T12:57:11.693104",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "Exception_A = salesMaster %>% filter(Total > 500&& Customer.type =='Member' && Quantity>5)\n",
    "Exception_B = salesMaster %>% filter(Total > 50&& Customer.type =='Normal')\n",
    "Exception_C = salesMaster %>% filter(Total > 5&& Customer.type =='Member' && Quantity<=5)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 5.311378,
   "end_time": "2023-07-10T12:57:11.869049",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-07-10T12:57:06.557671",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
