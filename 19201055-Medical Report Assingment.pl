go :-
    write('What is the patients name? '),
    readln(Patient),
    hypothesis(Patient,Disease),
    write_list([Patient,' probably has ',Disease,'.']),nl.

go :-
    write('Sorry, I don''t seem to be able to'),nl,
    write('diagnose the disease.'),nl.

symptom(Patient,fever) :-
    write_list(['Does ',Patient,' have a fever (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,vomitting) :-
    write_list(['Does ',Patient,' have a vomitting(y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,headache) :-
    write_list(['Does ',Patient,' have a headache (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,runny_nose) :-
    write_list(['Does ',Patient,' have a runny_nose (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,pale_bowel_movement) :-
    write_list(['Does ',Patient,' have a pale_bowel_movement(y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,cough) :-
    write_list(['Does ',Patient,' have a cough (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,body_ache) :-
    write_list(['Does ',Patient,' have a body_ache (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,chills) :-
    write_list(['Does ',Patient,' have a chills (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,sore_throat) :-
    write_list(['Does ',Patient,' have a sore_throat (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,sneezing) :-
    write_list(['Does ',Patient,' have a sneezing (y/n) ?']),
    response(Reply),
    Reply='y'.

symptom(Patient,Dark_color_urine ) :-
    write_list(['Does ',Patient,' have a Dark_color_urine (y/n) ?']),
    response(Reply),
    Reply='y'.

hypothesis(Patient,hemochromatosis) :- 
    symptom(Patient,stomach Pain),
    symptom(Patient,pain in joint),
    symptom(Patient,weakness),
    symptom(Patient,dark color urine),
    symptom(Patient,yellowish eyes and skin).

hypothesis(Patient,hepatitis_c) :-
  
    symptom(Patient,pain in joints),
    symptom(Patient,fever),
    symptom(Patient,fatigue),
    symptom(Patient,vomitting),
    symptom(Patient,pale bowel movement).

hypothesis(Patient,hepatitis_b) :-
    
    symptom(Patient,pale bowel movement),
    symptom(Patient,dark color urine),
    symptom(Patient,yellowish eyes and skin).

hypothesis(Patient,hepatitis_a) :-
  
    symptom(Patient,flu),
    symptom(Patient,yellowish eyes and skin).

hypothesis(Patient,jaundice) :-
    symptom(Patient,fever),
    symptom(Patient,abdominal pain),
    symptom(Patient,dark or brown-colored urine),
    symptom(Patient,yellowish eyes and skin).
hypothesis(Patient,covid-19) :-
  
    symptom(Patient,pain in joints),
    symptom(Patient,fever),
    symptom(Patient,cough),
    symptom(Patient,loss of taste or smell),
    symptom(Patient,diarrhea).

write_list([]).
write_list([Term| Terms]) :-
    write(Term),
    write_list(Terms).

response(Reply) :-
    get_single_char(Code),
    put_code(Code), nl,
    char_code(Reply, Code).
