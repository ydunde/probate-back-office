INSERT INTO CAVEATS_FLAT
(
ID,
CAVEAT_NUMBER,
PROBATE_NUMBER,
PROBATE_VERSION,
DECEASED_ID,
DECEASED_FORENAMES,
DECEASED_SURNAME,
DATE_OF_BIRTH,
DATE_OF_DEATH1,
ALIAS_NAMES,
CAVEAT_TYPE,
CAVEAT_DATE_OF_ENTRY,
CAV_DATE_LAST_EXTENDED,
CAV_EXPIRY_DATE,
CAV_WITHDRAWN_DATE,
CAVEATOR_TITLE,
CAVEATOR_HONOURS,
CAVEATOR_FORENAMES,
CAVEATOR_SURNAME,
CAV_SOLICITOR_NAME,
CAV_SERVICE_ADDRESS,
CAV_DX_NUMBER,
CAV_DX_EXCHANGE,
CAVEAT_TEXT,
CAVEAT_EVENT_TEXT,
DNM_IND,
LAST_MODIFIED
)
VALUES (
nextval('CAVEATS_FLAT_SEQ'),
'CAV_01',
'PRO_01',
1,
1,
'[FORENAME_REPLACE]',
'[SURNAME_REPLACE]',
'01/01/1900',
'01/01/2018',
'[ALIAS_REPLACE]',
'CAV_TYPE_1',
'01/01/2018',
'01/01/2018',
'01/01/2019',
'02/01/2018',
'Mr',
'Sir',
'CavFN1 CavFN2',
'CavSN',
'CavSolName',
'CavServiceAddress',
'DX-1',
'DX-EX-1',
'Caveat Text',
'Caveat Event Text',
'Y',
NOW()
);
