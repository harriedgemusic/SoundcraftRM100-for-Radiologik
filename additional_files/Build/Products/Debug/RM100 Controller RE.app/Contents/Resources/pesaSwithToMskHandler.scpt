FasdUAS 1.101.10   ��   ��    k             l     ��  ��    * $ PESA SWITCH TO MSK - script handler     � 	 	 H   P E S A   S W I T C H   T O   M S K   -   s c r i p t   h a n d l e r   
  
 h     �� �� .0 pesaswithtomskhandler pesaSwithToMskHandler  k             x     
�� ����    2   ��
�� 
osax��        l     ��  ��    %  PESA command data string maker     �   >   P E S A   c o m m a n d   d a t a   s t r i n g   m a k e r      i   
     I      �� ���� 0 
makestring 
MakeString   ��  o      ���� 0 thebytes theBytes��  ��    k     *       r          m      ! ! � " "     o      ���� 
0 thestr     # $ # Y    ' %�� & '�� % r    " ( ) ( b      * + * o    ���� 
0 thestr   + l    ,���� , I    - .�� - z����
�� .sysontocTEXT       shor
�� misccura . l    /���� / n     0 1 0 4    �� 2
�� 
cobj 2 o    ���� 0 i   1 o    ���� 0 thebytes theBytes��  ��  ��  ��  ��   ) o      ���� 
0 thestr  �� 0 i   & m    ����  ' n     3 4 3 1   	 ��
�� 
leng 4 o    	���� 0 thebytes theBytes��   $  5�� 5 L   ( * 6 6 o   ( )���� 
0 thestr  ��     7 8 7 l     ��������  ��  ��   8  9�� 9 i     : ; : I      �� <���� �0 Hpesaswtomsk_pesaswtomsk_pesaswtomsk_pesaswtomsk_pesaswtomsk_pesaswtomsk_ HpesaSwToMsk_pesaSwToMsk_pesaSwToMsk_pesaSwToMsk_pesaSwToMsk_pesaSwToMsk_ <  = > = o      ���� 0 pled0 pLED0 >  ? @ ? o      ���� 0 pled1 pLED1 @  A B A o      ���� 0 pled2 pLED2 B  C D C o      ���� 0 ctext cTEXT D  E F E o      ���� 0 	closedled 	closedLED F  G�� G o      ���� 0 cautled cautLED��  ��   ; k    � H H  I J I l     ��������  ��  ��   J  K L K r      M N M o     ���� 0 pled0 pLED0 N o      ���� 0 
pesaledoff 
PESAledOFF L  O P O r     Q R Q o    ���� 0 pled1 pLED1 R o      ���� 0 
pesaledon1 
PESAledON1 P  S T S r     U V U o    	���� 0 pled2 pLED2 V o      ���� 0 
pesaledon2 
PESAledON2 T  W X W r     Y Z Y o    ���� 0 ctext cTEXT Z o      ���� 0 cautiontext cautionText X  [ \ [ r     ] ^ ] o    ���� 0 	closedled 	closedLED ^ o      ���� "0 portclosedlabel PortClosedLabel \  _ ` _ r     a b a o    ���� 0 cautled cautLED b o      ���� 0 pesacaution PESAcaution `  c d c l   ��������  ��  ��   d  e f e I   $�� g h
�� .sysodlogaskr        TEXT g m     i i � j j $ M S K ' s   f a d e r   i s   O N ? h �� k l
�� 
btns k J     m m  n o n m     p p � q q  Y E S o  r�� r m     s s � t t  N O��   l �� u��
�� 
dflt u m     ���� ��   f  v w v l  % %��������  ��  ��   w  x y x r   % * z { z n   % ( | } | 1   & (��
�� 
bhit } 1   % &��
�� 
rslt { o      ���� 0 x   y  ~  ~ l  + +��������  ��  ��     � � � l  + +�� � ���   �   check PESA's state    � � � � &   c h e c k   P E S A ' s   s t a t e �  � � � l  + +��������  ��  ��   �  � � � Z   +� � ����� � =  + . � � � o   + ,���� 0 x   � m   , - � � � � �  Y E S � k   1� � �  � � � l  1 1��������  ��  ��   �  � � � l  1 1�� � ���   �   open PESA's port    � � � � "   o p e n   P E S A ' s   p o r t �  � � � r   1 H � � � I  1 F�� � �
�� .SPA_oSPAlong        TEXT � m   1 2 � � � � �  / d e v / c u . s e r i a l 1 � �� � �
�� 
SPbr � m   3 4����%� � �� � �
�� 
SPdb � m   5 6����  � �� � �
�� 
SPpa � m   7 8����   � �� � �
�� 
SPsb � m   ; <����  � �� ���
�� 
SPhs � m   ? @����  ��   � o      ���� 0 portpesa portPesa �  � � � l  I I��������  ��  ��   �  � � � l  I I�� � ���   �   check availability    � � � � &   c h e c k   a v a i l a b i l i t y �  � � � l  I I��������  ��  ��   �  ��� � Z   I� � ��� � � =  I L � � � o   I J���� 0 portpesa portPesa � m   J K������ � k   O � � �  � � � O  O Z � � � I   S Y�� ����� 0 
sethidden_ 
setHidden_ �  ��� � m   T U���� ��  ��   � o   O P���� 0 
pesaledoff 
PESAledOFF �  � � � O  [ f � � � I   _ e�� ����� 0 
sethidden_ 
setHidden_ �  ��� � m   ` a���� ��  ��   � o   [ \���� 0 
pesaledon1 
PESAledON1 �  � � � O  g r � � � I   k q�� ����� 0 
sethidden_ 
setHidden_ �  ��� � m   l m���� ��  ��   � o   g h���� 0 
pesaledon2 
PESAledON2 �  � � � O  s ~ � � � I   w }�� ���� 0 
sethidden_ 
setHidden_ �  ��~ � m   x y�}�} �~  �   � o   s t�|�| 0 cautiontext cautionText �  � � � O   � � � � I   � ��{ ��z�{ 0 
sethidden_ 
setHidden_ �  ��y � m   � ��x�x �y  �z   � o    ��w�w "0 portclosedlabel PortClosedLabel �  � � � O  � � � � � I   � ��v ��u�v 0 
sethidden_ 
setHidden_ �  ��t � m   � ��s�s  �t  �u   � o   � ��r�r 0 pesacaution PESAcaution �  ��q � I  � ��p ��o
�p .ascrcmnt****      � **** � m   � � � � � � � B P E S A ' s   s e r i a l   p o r t   i s   u n a v a i l a b l e�o  �q  ��   � k   �� � �  � � � l  � ��n�m�l�n  �m  �l   �  � � � l  � ��k � ��k   � %  generating data string to port    � � � � >   g e n e r a t i n g   d a t a   s t r i n g   t o   p o r t �  � � � l  � ��j�i�h�j  �i  �h   �  � � � r   � � � � � I   � ��g ��f�g 0 
makestring 
MakeString �  ��e � J   � � � �  � � � m   � ��d�d H �  � � � m   � ��c�c 0 �  � � � m   � ��b�b 0 �  � � � m   � ��a�a 8 �  � � � m   � ��`�` 0 �  � � � m   � ��_�_ 0 �  � � � m   � ��^�^ 2 �  �  � m   � ��]�] 0   m   � ��\�\ 0  m   � ��[�[ 2  m   � ��Z�Z 0  m   � ��Y�Y 0 	
	 m   � ��X�X 2
  m   � ��W�W 0  m   � ��V�V 0  m   � ��U�U 2  m   � ��T�T 4  m   � ��S�S 9 �R m   � ��Q�Q 
�R  �e  �f   � o      �P�P &0 pesacommand1tomsk pesaCommand1ToMSK �  I  � ��O�N
�O .ascrcmnt****      � **** m   � � � * g e n e r a t e d   1 s t   c o m m a n d�N    r   �2 I   �0�M�L�M 0 
makestring 
MakeString  �K  J   �,!! "#" m   � ��J�J H# $%$ m   � ��I�I 0% &'& m   � ��H�H 0' ()( m   � ��G�G 2) *+* m   � ��F�F 0+ ,-, m   ��E�E 0- ./. m  �D�D 8/ 010 m  �C�C 01 232 m  
�B�B 03 454 m  
�A�A 85 676 m  �@�@ 07 898 m  �?�? 09 :;: m  �>�> 8; <=< m  �=�= 0= >?> m  �<�< 0? @A@ m  �;�; 8A BCB m  "�:�: 5C DED m  "%�9�9 ;E F�8F m  %(�7�7 
�8  �K  �L   o      �6�6 &0 pesacommand2tomsk pesaCommand2ToMSK GHG I 3:�5I�4
�5 .ascrcmnt****      � ****I m  36JJ �KK * g e n e r a t e d   2 s t   c o m m a n d�4  H LML I ;B�3N�2
�3 .sysodelanull��� ��� nmbrN m  ;>OO ?�      �2  M PQP l CC�1�0�/�1  �0  �/  Q RSR l CC�.TU�.  T "  sending data string to port   U �VV 8   s e n d i n g   d a t a   s t r i n g   t o   p o r tS WXW l CC�-�,�+�-  �,  �+  X YZY I CL�*[\
�* .SPA_wSPAnull���     TEXT[ o  CD�)�) &0 pesacommand1tomsk pesaCommand1ToMSK\ �(]�'
�( 
SPpt] o  GH�&�& 0 portpesa portPesa�'  Z ^_^ I MT�%`�$
�% .sysodelanull��� ��� nmbr` m  MPaa ?�      �$  _ bcb I U^�#de
�# .SPA_wSPAnull���     TEXTd o  UV�"�" &0 pesacommand2tomsk pesaCommand2ToMSKe �!f� 
�! 
SPptf o  YZ�� 0 portpesa portPesa�   c ghg l __����  �  �  h iji l __�kl�  k   close PESA's port   l �mm $   c l o s e   P E S A ' s   p o r tj non I _h�p�
� .SPA_cSPAnull���     longp n _dqrq o  `d�� 0 portpesa portPesar  f  _`�  o sts O ituvu I  ms�w�� 0 
sethidden_ 
setHidden_w x�x m  no�� �  �  v o  ij�� "0 portclosedlabel PortClosedLabelt yzy O u�{|{ I  y�}�� 0 
sethidden_ 
setHidden_} ~�~ m  z{�� �  �  | o  uv�� 0 
pesaledoff 
PESAledOFFz � O ����� I  ������ 0 
sethidden_ 
setHidden_� ��� m  ���
�
 �  �  � o  ���	�	 0 
pesaledon2 
PESAledON2� ��� O ����� I  ������ 0 
sethidden_ 
setHidden_� ��� m  ����  �  �  � o  ���� 0 
pesaledon1 
PESAledON1�  ��  ��  ��   � ��� l ����� �  �  �   � ��� l ��������  � * $ Nothing to do if MSK's fader is off   � ��� H   N o t h i n g   t o   d o   i f   M S K ' s   f a d e r   i s   o f f� ��� l ����������  ��  ��  � ��� Z  ��������� = ����� o  ������ 0 x  � m  ���� ���  N O� I �������
�� .ascrcmnt****      � ****� o  ������ 0 x  ��  ��  ��  � ���� l ����������  ��  ��  ��  ��    ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       ������  � ���� .0 pesaswithtomskhandler pesaSwithToMskHandler� ��   ��� .0 pesaswithtomskhandler pesaSwithToMskHandler� ��������  � ������
�� 
pimr�� 0 
makestring 
MakeString�� �0 Hpesaswtomsk_pesaswtomsk_pesaswtomsk_pesaswtomsk_pesaswtomsk_pesaswtomsk_ HpesaSwToMsk_pesaSwToMsk_pesaSwToMsk_pesaSwToMsk_pesaSwToMsk_pesaSwToMsk_� ����� �  �� �����
�� 
cobj� ��   ��
�� 
osax��  � �� ���������� 0 
makestring 
MakeString�� ����� �  ���� 0 thebytes theBytes��  � �������� 0 thebytes theBytes�� 
0 thestr  �� 0 i  �  !��������
�� 
leng
�� misccura
�� 
cobj
�� .sysontocTEXT       shor�� +�E�O "k��,Ekh �� 
��/j U%E�[OY��O�� �� ;���������� �0 Hpesaswtomsk_pesaswtomsk_pesaswtomsk_pesaswtomsk_pesaswtomsk_pesaswtomsk_ HpesaSwToMsk_pesaSwToMsk_pesaSwToMsk_pesaSwToMsk_pesaSwToMsk_pesaSwToMsk_�� ����� �  �������������� 0 pled0 pLED0�� 0 pled1 pLED1�� 0 pled2 pLED2�� 0 ctext cTEXT�� 0 	closedled 	closedLED�� 0 cautled cautLED��  � ���������������������������������� 0 pled0 pLED0�� 0 pled1 pLED1�� 0 pled2 pLED2�� 0 ctext cTEXT�� 0 	closedled 	closedLED�� 0 cautled cautLED�� 0 
pesaledoff 
PESAledOFF�� 0 
pesaledon1 
PESAledON1�� 0 
pesaledon2 
PESAledON2�� 0 cautiontext cautionText�� "0 portclosedlabel PortClosedLabel�� 0 pesacaution PESAcaution�� 0 x  �� 0 portpesa portPesa�� &0 pesacommand1tomsk pesaCommand1ToMSK�� &0 pesacommand2tomsk pesaCommand2ToMSK� * i�� p s���������� � ��������������������� �����������������������JO�����������
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit
�� 
SPbr��%�
�� 
SPdb�� 
�� 
SPpa
�� 
SPsb
�� 
SPhs�� 

�� .SPA_oSPAlong        TEXT�� 0 
sethidden_ 
setHidden_
�� .ascrcmnt****      � ****�� H�� 0�� 8�� 2�� 4�� 9�� �� 0 
makestring 
MakeString�� 5�� ;
�� .sysodelanull��� ��� nmbr
�� 
SPpt
�� .SPA_wSPAnull���     TEXT�� 0 portpesa portPesa
�� .SPA_cSPAnull���     long����E�O�E�O�E�O�E�O�E�O�E�O����lv�l� O��,E�O�� l������ja ka ja  E�O�i  T� *kk+ UO� *kk+ UO� *kk+ UO� *kk+ UO� *kk+ UO� *jk+ UOa j Y �*a a a a a a a a a a a a a a a a a a a a vk+ E�Oa j O*a a a a a a a a a a a a a a a a a  a !a a vk+ E�Oa "j Oa #j $O�a %�l &Oa #j $O�a %�l &O)a ',j (O� *kk+ UO� *kk+ UO� *kk+ UO� *jk+ UY hO�a )  
�j Y hOP ascr  ��ޭ