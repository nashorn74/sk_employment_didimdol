select sysdate, ROUND(sysdate,'day'),
  trunc(sysdate,'day') from dual;