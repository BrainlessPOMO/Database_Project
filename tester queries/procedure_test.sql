call Procedure1('s', 2, '2021-05-26', '2021-05-28'); -- test Proc1 for series
call Procedure1('m', 2, '2021-05-26', '2021-05-28'); -- test Proc1 for movies



call Procedure2('LINDA.WILLIAMS@gmail.org', '2021-05-29', @rentals_right); -- test Proc2, it has to have a number as result other than 0
select @rentals_right; 

call Procedure2('amelia2002@yahoo.com', '2021-05-29', @rentals_wrong); -- test Proc2, it has to have 0 as result
select @rentals_wrong;

call Procedure3();

call Procedure4('CHASE', 'WAHLBERG');

call Procedure5('GUINESS'); -- ελέγχουμε το Proc5, πρέπει να εμφανιστεί και το πλήθος των ηθοποιών (2)
call Procedure5('WAHLBERG'); -- ελέγχουμε το Proc5, δεν πρέπει να εμφανιστεί το πλήθος των ηθοποιών

