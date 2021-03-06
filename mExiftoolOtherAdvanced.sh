#!/bin/bash
 E='echo -e';e='echo -en';trap "R;exit" 2
 ESC=$( $e "\e")
 TPUT(){ $e "\e[${1};${2}H" ;}
 CLEAR(){ $e "\ec";}
# 25 возможно это
 CIVIS(){ $e "\e[?25l";}
# это цвет текста списка перед курсором при значении 0 в переменной  UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;90m";}
# 0 это цвет заднего фона списка
 UNMARK(){ $e "\e[0m";}
# ~~~~~~~~ Эти строки задают цвет фона ~~~~~~~~
 R(){ CLEAR ;stty sane;CLEAR;};
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 HEAD(){ for (( a=2; a<=25; a++ ))
  do
   TPUT $a 1
 $E "\033[34m\xE2\x94\x82                                                                                                                                                       \xE2\x94\x82\033[0m";
  done
 TPUT 2 3
 $E "\033[1;36mДругие варианты\033[0m                                                   \033[2mOther options\033[0m";
 TPUT 8 3
 $E "\033[1;36mОсобые возможности\033[0m                                                \033[2mSpecial features\033[0m";
 TPUT 12 3
 $E "\033[1;36mРасширенные oпции\033[0m                                                 \033[2mAdvanced options\033[0m";
 TPUT 24 4
 $E "\033[32mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\033[0m";
 MARK;TPUT 1 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m" ;UNMARK;}
  i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 26 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
  M0(){ TPUT  3 3; $e "Прочитать аргументы командной строки из указанного файла                               \033[32m -@ ARGFILE                                                  \033[0m";}
  M1(){ TPUT  4 3; $e "Сделайте паузу с сообщением, нажмите клавишу или нажмите RETURN                        \033[32m -k (-pause)                                                 \033[0m";}
  M2(){ TPUT  5 3; $e "Распечатать список всех допустимых имен тегов                                          \033[32m -list -listw -listf -listr -listwf -listg[NUM] -listd -listx\033[0m";}
  M3(){ TPUT  6 3; $e "Вывести номер версии exiftool                                                          \033[32m -ver                                                        \033[0m";}
  M4(){ TPUT  7 3; $e "Обозначает конец опций                                                                 \033[32m --                                                          \033[0m";}
#
  M5(){ TPUT  9 3; $e "Изображения с геотегами из указанного файла журнала GPS-трека                          \033[32m -geotag TRKFILE                                             \033[0m";}
  M6(){ TPUT 10 3; $e "Сдвигает все форматированные значения даты / времени на величину                       \033[32m -globalTimeShift SHIFT                                      \033[0m";}
  M7(){ TPUT 11 3; $e "Добавить функции из указанного модуля МОДУЛЯ                                           \033[32m -use MODULE                                                 \033[0m";}
#
  M8(){ TPUT 13 3; $e "Примечание                                                                             \033[32m note                                                        \033[0m";}
  M9(){ TPUT 14 3; $e "Установите параметр ExifTool API                                                       \033[32m -api OPT[[^]=[VAL]]                                         \033[0m";}
 M10(){ TPUT 15 3; $e "Bсе аргументы, следующие за опцией, являются общими для всех команд при -execute       \033[32m -common_args                                                \033[0m";}
 M11(){ TPUT 16 3; $e "Загрузить указанный файл конфигурации вместо файла по умолчанию «.ExifTool_config»     \033[32m -config CFGFILE                                             \033[0m";}
 M12(){ TPUT 17 3; $e "Вывести ТЕКСТ на стандартный вывод (-echo или -echo1) или на стандартный вывод (-echo2)\033[32m -echo[NUM] TEXT                                             \033[0m";}
 M13(){ TPUT 18 3; $e "Сохраните имена файлов с ошибками                                                      \033[32m -efile[NUM][!] ERRFILE                                      \033[0m";}
 M14(){ TPUT 19 3; $e "Выполнить команду для всех аргументов до этого момента в командной строке              \033[32m -execute[NUM]                                               \033[0m";}
 M15(){ TPUT 20 3; $e "Укажите другой исходный файл для обработки на основе имени исходного ФАЙЛА             \033[32m -srcfile FMT                                                \033[0m";}
 M16(){ TPUT 21 3; $e "Если FLAG равен 1 или True, exiftool продолжает чтение из - @ ARGFILE                  \033[32m -stay_open FLAG                                             \033[0m";}
 M17(){ TPUT 22 3; $e "Установите пользовательский параметр                                                   \033[32m -userParam PARAM[[^]=[VAL]]                                 \033[0m";}
 M18(){ TPUT 23 3; $e "Расширенная функция форматирования                                                     \033[32m Advanced formatting feature                                 \033[0m";}
#
 M19(){ TPUT 25 3; $e "Выход                                                                                  \033[32m EXIT                                                        \033[0m";}
 LM=19
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
 0) S=M0;SC;if [[ $cur == enter ]];then R;echo "
    Прочитать аргументы командной строки из указанного файла. Файл содержит по одному аргументу на строку (НЕ по одному параметру на строку - для некоторых параметров
 требуется дополнительные аргументы, причем все аргументы должны быть помещены в отдельные строки). Пустые строки и строки, начинающиеся с \"#\", игнорируются (если
 они не начинаются с \"# [CSTR]\", и в этом случае остальная часть строки обрабатывается как строка C, что позволяет использовать стандартные
 escape-последовательности C, такие как \" \\ n\" для новой строки). белый пробел в начале строки удаляется. Обычная обработка аргументов оболочкой не выполняется,
 что, среди прочего, означает, что аргументы должны не заключаться в кавычки, а пробелы обрабатываются как любой другой символ. ARGFILE может существовать
 относительно текущего каталога или каталога exiftool если не указан абсолютный путь.
    Например, следующий ARGFILE установит для параметра Copyright значение «Copyright YYYY, Phil Harvey», где «YYYY» - год CreateDate:
    -d
    % Y
    -copyright <Copyright \$ createdate, Фил Харви
    Аргументы в ARGFILE ведут себя точно так же, как если бы они были введены в месте, где указан параметр - @ в командной строке, за исключением того, что Параметры
 -config и -common_args нельзя использовать в ARGFILE.
";ES;fi;;
 1) S=M1;SC;if [[ $cur == enter ]];then R;echo "    Сделайте паузу с сообщением «- нажмите любую клавишу -» или «- нажмите RETURN -» (в зависимости от вашей системы) перед завершением. Эта опция используется для
 предотвращения окно команд не закрывается при запуске в качестве приложения Windows с перетаскиванием.";ES;fi;;
 2) S=M2;SC;if [[ $cur == enter ]];then R;echo "
    Распечатать список:
 всех допустимых имен тегов            (-list),
 всех доступных для записи имен тегов  (-listw),
 всех поддерживаемых расширений файлов (-listf),
 всех распознанных расширений файлов   (-listr),
 все расширения файлов с возможностью записи (-listwf),
 все группы тегов [в указанном семействе] (-listg [NUM]),
 все удаляемые группы тегов (-listd) или XML база данных деталей тегов, включая языковые переводы (-listx).
    За параметрами -list, -listw и -listx может следовать дополнительный аргумент форма «-GROUP: All» для перечисления только тегов в определенной группе,
 где «GROUP» - это одно или несколько имен групп семейства 0–2 (за исключением групп EXIF ​​IFD), разделенных двоеточиями. С -listg можно указать NUM для указания
 семейства группы, в противном случае предполагается семейство 0. Опцию -l можно комбинировать с -listf, -listr или -listwf, чтобы добавить описания файлов в список.
 Опцию -lang можно комбинировать с -listx для вывода описаний на одном языке.
    Вот некоторые примеры:
                -list                 # перечислить все имена тегов
                -list -EXIF: All      # перечислить все теги EXIF
                -list -xmp: time: all # перечислить все теги XMP, относящиеся ко времени
                -listw -XMP-dc: All   # перечислить все доступные для записи теги XMP-dc
                -listf                # перечислить все поддерживаемые расширения файлов
                -listr                # перечислить все распознанные расширения файлов
                -listwf               # перечислить все доступные для записи расширения файлов
                -listg1               # перечислить все группы в семье 1
                -listd                # перечислить все удаляемые группы
                -listx -EXIF: Все     # список базы данных тегов EXIF ​​в формате XML
                -listx -XMP: All -s   # перечислить короткую XML-базу данных тегов XMP
    В сочетании с -listx опция -s сокращает вывод, опуская описания и значения (как в последнем примере выше), а -f добавляет атрибут 'flags', если применимо.
 Флаги отформатированы как список следующих возможных значений, разделенных запятыми: Avoid, Binary, List, Mandatory, Постоянный, Защищенный, Неизвестный и
 Небезопасный (см. Документацию по именам тегов). Для тегов XMP List тип списка (Alt, Bag или Seq) добавляется к флагам, а теги плоской структуры обозначаются
 флажком Flattened. Обратите внимание, что ни одна из опций -list не требует ввода ФАЙЛ.
";ES;fi;;
 3) S=M3;SC;if [[ $cur == enter ]];then R;echo "    Вывести номер версии exiftool. Параметр -v может быть добавлен для вывода дополнительной системной информации (см. Файл README полного дистрибутива для получения
 дополнительной информации подробности о дополнительных библиотеках) или -v2, чтобы также вывести список подключаемых каталогов Perl.";ES;fi;;
 4) S=M4;SC;if [[ $cur == enter ]];then R;echo " Обозначает конец опций. Любые оставшиеся аргументы рассматриваются как имена файлов, даже если они начинаются с тире («-»).";ES;fi;;
 5) S=M5;SC;if [[ $cur == enter ]];then R;echo "
    Изображения с геотегами из указанного файла журнала GPS-трека. Использование опции -geotag эквивалентно записи значения в тег «Geotag». Положение GPS
 интерполируется из трека во время, указанное значением, записанным в тег \"Geotime\". Если \"Geotime\" не указано, значение копируется из «DateTimeOriginal
 #» («#» добавляется для копирования неформатированного значения, избегая потенциальных конфликтов с параметром -d). Например, следующие двe команды эквивалентны:
                exiftool -geotag trk.log image.jpg
                exiftool -geotag trk.log \"-Geotime <DateTimeOriginal #\" image.jpg
    Когда значение «Geotime» преобразуется в UTC, используется часовой пояс локальной системы, если только значение даты / времени не содержит часовой пояс.
 Написание \"Geotime\" вызывает запись следующих тегов (при условии, что они могут быть вычислены из журнала треков и поддерживаются метаданными назначения формат):
 GPSLatitude, GPSLatitudeRef, GPSLongitude, GPSLongitudeRef, GPSAltitude, GPSAltitudeRef, GPSDateStamp, GPSTimeStamp, GPSDateTime, GPSTrack, GPSTrackRef, GPSSpeed,
 GPSSpeedRef, GPSImgDirection, GPSImgDirectionRef, GPSPitch, GPSRoll, AmbientTemperature и CameraElevationAngle. По умолчанию, теги создаются в EXIF ​​и обновляются в
 XMP, только если они уже существуют. Однако \"EXIF: Geotime\" или \"XMP: Geotime\" можно указать для записи только EXIF или теги XMP соответственно. Обратите
 внимание, что GPSPitch и GPSRoll нестандартны, и для их записи требуются пользовательские теги.
    Тег «Geosync» может использоваться для указания поправки времени, которая применяется к каждому значению «Geotime» для синхронизации со временем GPS. Например,
 следующая команда компенсирует время изображения, которое отстает от GPS на 1 минуту и ​​20 секунд:
    exiftool -geosync = + 1: 20 -geotag a.log DIR
    Усовершенствованные функции «Geosync» позволяют производить линейную коррекцию временного дрейфа и синхронизацию с ранее отмеченными геотегами изображениями. См.
 \"Geotag.html\" полностью. Дистрибутив ExifTool для получения дополнительной информации.
    Для объединения данных журнала треков GPS можно использовать несколько параметров -geotag. Кроме того, опция -geotag может использоваться для загрузки нескольких
 файлов журнала треков с помощью используя подстановочные знаки в имени TRKFILE, но обратите внимание, что в этом случае TRKFILE необходимо заключить в кавычки в
 большинстве систем (за заметным исключением Windows), чтобы предотвратить расширение имени файла. Например:
    exiftool -geotag \"TRACKDIR / *. log\" IMAGEDIR
    В настоящее время поддерживаются следующие форматы файлов треков: GPX, NMEA RMC / GGA / GLL, KML, IGC, Garmin XML и TCX, Magellan PMGNTRK, Honeywell PTNTHPR,
 Bramor gEO, Файлы Winplus Beacon TXT и GPS / IMU CSV. Примеры см. В разделе «ПРИМЕРЫ ГЕОТАГНИРОВАНИЯ». Также см. «Geotag.html» в полном дистрибутиве ExifTool и
 Image :: ExifTool Options для получения более подробной информации и информации о параметрах конфигурации геотегов.
";ES;fi;;
 6) S=M6;SC;if [[ $cur == enter ]];then R;echo "
    Сдвигает все форматированные значения даты / времени на указанную величину при чтении. Не применяется к неформатированному (-n) выводу. SHIFT имеет ту же форму,
 что и сдвиг даты / времени при записи (подробности см. в Image :: ExifTool :: Shift.pl), при этом отрицательный сдвиг обозначается знаком минус (\"-\") в начало
 строки SHIFT. Например: # вернуть все дату / время со сдвигом на 1 час назад
                         exiftool -globalTimeShift -1 -time: все a.jpg
                         # задаем имя файла из сдвинутой CreateDate (-1 день) для
                         # все изображения в каталоге
                         exiftool \"-filename <createdate\" -globaltimeshift \"-0: 0: 1 0: 0: 0\" \\
                         -d% Y% m% d-% H% M% S. %% e dir
";ES;fi;;
 7) S=M7;SC;if [[ $cur == enter ]];then R;echo "    Добавить функции из указанного модуля МОДУЛЯ. В настоящее время модуль MWG - единственный подключаемый модуль, распространяемый с exiftool. Этот модуль добавляет
 поддержка чтения / записи тегов в соответствии с рекомендациями Рабочей группы по метаданным. Для удобства предполагается \"-use MWG\", если группа \"MWG\" указана
 для любой тег в командной строке. Дополнительную информацию см. В документации по тегам MWG. Обратите внимание, что этот параметр необратим и действует до тех пор,
 пока приложение завершает работу даже при использовании параметра «-execute».";ES;fi;;
#==================================================================================================================================================================
 8) S=M8;SC;if [[ $cur == enter ]];then R;echo "    Среди прочего, расширенные параметры позволяют выполнять сложную обработку с помощью одной команды без необходимос>
 особенно полезен для таких реализаций, как приложения Windows с перетаскиванием. Эти параметры также можно использовать для повышения производительности в
 многоцелевых системах передать обработку, уменьшив накладные расходы, необходимые для загрузки exiftool при каждом вызове.";ES;fi;;
 9) S=M9;SC;if [[ $cur == enter ]];then R;echo "    Установите параметр ExifTool API. OPT - это имя опции API. Значение опции устанавливается на 1, если = VAL опущено>
 устанавливается на undef, если используется \"=\", или пустая строка с \"^ =\". См. В разделе Параметры Image :: ExifTool список доступных параметров API.
 Это отменяет набор параметров API через файл конфигурации.";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo "    Указывает, что все аргументы, следующие за этой опцией, являются общими для всех выполняемых команд при использова>
 являются только параметры, которые нельзя использовать внутри - @ ARGFILE. Обратите внимание, что по определению эта опция и ее аргументы ДОЛЖНЫ идти после всех
 других опций в командная строка.";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo "    Загрузить указанный файл конфигурации вместо файла по умолчанию «.ExifTool_config». Если используется, этот параме>
 аргументами команды строка и применяется ко всем командам -execute'd. CFGFILE должен существовать относительно текущего рабочего каталога или каталога приложения
 exiftool если не указан абсолютный путь. Загрузку файла конфигурации по умолчанию можно отключить, установив для CFGFILE пустую строку (например, \"\"). Видеть
 https://exiftool.org/config.html> и config_files/example.config в полном дистрибутиве ExifTool для получения подробной информации о синтаксисе файла конфигурации.";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo "    Вывести ТЕКСТ на стандартный вывод (-echo или -echo1) или на стандартный вывод (-echo2). Текст выводится по мере а>
 входных файлов. NUM также может быть 3 или 4 для вывода текста (в stdout или stderr соответственно) после завершения обработки.";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo "    Сохраните имена файлов с ошибками (ЧИСЛО отсутствует или 1), файлов, которые не были изменены (ЧИСЛО равно 2), фай>
 (ЧИСЛО равно 4), или любых их комбинация (суммируя NUM, например, -efile3 имеет одинаковые параметры -efile и -efile2 с одним и тем же ERRFILE). По умолчанию файл
 имена добавляются к любому существующему ERRFILE, но ERRFILE перезаписывается, если к параметру добавляется восклицательный знак (например, -efile!). Сохраняет имя
 файла, указанного параметром -srcfile, если применимо.";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo "    Выполнить команду для всех аргументов до этого момента в командной строке (плюс любые аргументы, указанные в -comm>
 выполнялись как отдельные командные строки (за исключением параметров -config и -use, которые остаются в силе для последующих команд). Позволяет выполнять несколько
 команд из одной командной строки. ЧИСЛО - необязательное число, которое отображается в сообщении \"{ready}\" при использовании -stay_open особенность.";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo "    Укажите другой исходный файл для обработки на основе имени исходного ФАЙЛА. Это может быть полезно в некоторых осо>
 изображения предварительного просмотра или сопроводительные файлы. См. Описание синтаксиса FMT в параметре -w. Обратите внимание, что строки FMT имени файла для всех
 параметров на основе исходного ФАЙЛА, указанного в командной строке, а не имени исходного файла, указанного параметром -srcfile.
    Например, чтобы скопировать метаданные из файлов NEF в соответствующие превью JPG в каталоге, где могут существовать другие изображения JPG:
    exiftool -ext nef -tagsfromfile @ -srcfile% d% f.jpg каталог
    Если указано более одного параметра -srcfile, файлы проверяются по порядку, и обрабатывается первый существующий исходный файл. Если ни один из источников файлы
 уже существуют, тогда exiftool использует первый указанный -srcfile.
    FMT «@» может использоваться для представления исходного ФАЙЛА, что может быть полезно при указании нескольких параметров -srcfile (например, для возврата к
 обработке исходный ФАЙЛ, если нет сопроводительной книги).
    Когда используется этот параметр, создаются два специальных тега UserParam (OriginalFileName и OriginalDirectory), чтобы разрешить доступ к исходному имени ФАЙЛА.
 и каталог.";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo "
    Если FLAG равен 1 или True, exiftool продолжает чтение из - @ ARGFILE даже после достижения конца файла. Эта функция позволяет звонить приложения для
 предварительной загрузки exiftool, что позволяет избежать накладных расходов на загрузку exiftool для каждой команды. Порядок действий следующий:
    1) Выполните «exiftool -stay_open True - @ ARGFILE», где ARGFILE - это имя существующего (возможно, пустого) файла аргументов или «-» для передачи аргументов по
 конвейеру со стандартного ввода.
    2) Запишите аргументы командной строки exiftool в ARGFILE, по одному аргументу на строку (подробности см. В параметре - @).
    3) Запишите «-execute \\ n» в ARGFILE, где «\\ n» представляет собой последовательность новой строки. (Примечание: вам может потребоваться очистить буферы записи
 здесь, если вы используете буферизованный ExifTool затем выполнит команду с аргументами, полученными до этого момента, отправит сообщение \"{ready}\" на стандартный
 вывод, когда будет выполнено (если только используется параметр -q или -T), и продолжайте попытки чтения аргументов для следующей команды из ARGFILE. Чтобы помочь в
 синхронизации команды / ответа, любое число, добавленное к параметру «-execute», отображается в сообщении «{готово}». Например, «-execute613» дает «{ready613}».
    4) Повторите шаги 2 и 3 для каждой команды.
    5) По завершении напишите \"-stay_open\\nFalse\\n\" в ARGFILE. Это заставит exiftool обработать все оставшиеся аргументы командной строки, а затем завершить
 работу в обычном режиме. Входной ARGFILE можно изменить в любое время до шага 5 выше, записав следующие строки в текущий открытый ARGFILE:
                -stay_open
                True
                -@
                NEWARGFILE
    Это приводит к тому, что ARGFILE закрывается, а NEWARGFILE остается открытым. (Без -stay_open здесь exiftool вернулся бы к чтению аргументов из ARGFILE после
 достижения конца NEWARGFILE.)
    Примечание. При записи аргументов в файл на диске существует задержка до 0,01 секунды после записи «-execute \\ n», прежде чем exiftool начнет обрабатывать
 команда. Этой задержки можно избежать, отправив сигнал CONT процессу exiftool сразу после записи «-execute \\ n». (Нет связанного задержка при записи аргументов
 через конвейер с «- @ -», поэтому сигнал не требуется при использовании этого метода.)
";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo "    Установите пользовательский параметр. PARAM - произвольное имя параметра пользователя. Это интерфейс для параметра>
 документация) и предоставляет метод доступа к параметрам, определяемым пользователем, в аргументах опций -if и -p, как если бы они были любым другим тегом.
 Добавление хэш-тега (\"#\") к PARAM также приводит к извлечению параметра как обычного тега (в группе UserParam). Подобно параметру -api, значение параметра
 устанавливается в 1, если = VAL опущено, undef, если только VAL опущен с «=», или пустая строка, если VAL опущен с «^ =»
    exiftool -p '\$test from $filename' -userparam test=Hello FILE";ES;fi;;
18) S=M18;SC;if [[ $cur == enter ]];then R;echo "
    Расширенная функция форматирования позволяет изменять значение любого тега, интерполированного в аргументе параметра -if или -p, или перенаправлении -tagsFromFile.
 нить Имена тегов в этих строках начинаются с символа «\$», и к значению тега можно применить произвольное выражение Perl, поместив фигурные скобки вокруг имени тега
 и вставка выражения после имени, разделенного точкой с запятой (например, «\$ {TAG; EXPR}»). Выражение действует на значение тега через входную переменную по
 умолчанию (\$ _) и имеет доступ к полному API ExifTool через текущий объект ExifTool (\$ self) и ключ тега (\$ tag). Это может содержать любой допустимый код Perl,
 включая операции перевода (\"tr ///\") и подстановки (\"s ///\"), но учтите, что фигурные скобки внутри выражения должны быть сбалансированный. В приведенном ниже
 примере печатается Make Camera с пробелами, переведенными в подчеркивания, и несколькими последовательными подчеркиваниями, замененными одним подчеркните:
    exiftool -p '\${make;tr/ /_/;s/__+/_/g}' image.jpg
    После имени тега может быть добавлен символ «@», чтобы выражение действовало на отдельные элементы списка для тегов типа списка, что упрощает обработку списка.
 Установите \$ _ на undef, чтобы удалить элемент из списка. Например, следующая команда возвращает все темы, не содержащие строку «xxx»:
    exiftool -p '\${subject@;$_=undef if /xxx/}' image.jpg
    Выражение по умолчанию \"tr (/ \\? *: |\" <> \ 0) () d \"предполагается, если выражение пустое (например,\" \$ {TAG;} \"). Это удаляет символы / \? *: | <> и null
 от напечатанного значения. (Эти символы недопустимы в именах файлов Windows, поэтому эта функция полезна, если значения тегов используются в именах файлов.)
";ES;fi;;
#==================================================================================================================================================================
19) S=M19;SC;if [[ $cur == enter ]];then R;clear;exit 0;fi;;
 esac;POS;done
