FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l     �� 	 
��   	    AppDelegate.applescript    
 �   2     A p p D e l e g a t e . a p p l e s c r i p t      l     ��  ��       RM-100 FaderController     �   0     R M - 1 0 0   F a d e r C o n t r o l l e r      l     ��������  ��  ��        l     ��  ��    , &  Created by Radio On-Air on 09.12.16.     �   L     C r e a t e d   b y   R a d i o   O n - A i r   o n   0 9 . 1 2 . 1 6 .      l     ��  ��    ; 5  Copyright ? 2016 Radio On-Air. All rights reserved.     �   j     C o p y r i g h t  ��   2 0 1 6   R a d i o   O n - A i r .   A l l   r i g h t s   r e s e r v e d .      l     ��������  ��  ��         l     ��������  ��  ��      ! " ! h     �� #�� 0 	testclass 	TestClass # k       $ $  % & % j     �� '
�� 
pare ' 4     �� (
�� 
pcls ( m     ) ) � * *  N S O b j e c t &  + , + l     ��������  ��  ��   ,  - . - l     �� / 0��   /  
 IBOutlets    0 � 1 1    I B O u t l e t s .  2 3 2 j   	 �� 4�� 0 	thewindow 	theWindow 4 m   	 
��
�� 
msng 3  5 6 5 j    �� 7�� 0 cautionicon cautionIcon 7 m    ��
�� 
msng 6  8 9 8 j    �� :�� 0 cautiontext cautionText : m    ��
�� 
msng 9  ; < ; j    �� =�� 0 	ledgreen1 	ledGreen1 = m    ��
�� 
msng <  > ? > j    �� @�� 0 ledred1 ledRed1 @ m    ��
�� 
msng ?  A B A j    �� C�� 0 lednone1 ledNone1 C m    ��
�� 
msng B  D E D j    �� F�� 0 	ledgreen2 	ledGreen2 F m    ��
�� 
msng E  G H G j     �� I�� 0 ledred2 ledRed2 I m    ��
�� 
msng H  J K J j   ! #�� L�� 0 lednone2 ledNone2 L m   ! "��
�� 
msng K  M N M j   $ &�� O�� 0 	ledgreen3 	ledGreen3 O m   $ %��
�� 
msng N  P Q P j   ' )�� R�� 0 ledred3 ledRed3 R m   ' (��
�� 
msng Q  S T S j   * ,�� U�� 0 lednone3 ledNone3 U m   * +��
�� 
msng T  V W V j   - /�� X�� 0 	ledgreen4 	ledGreen4 X m   - .��
�� 
msng W  Y Z Y j   0 2�� [�� 0 ledred4 ledRed4 [ m   0 1��
�� 
msng Z  \ ] \ j   3 5�� ^�� 0 lednone4 ledNone4 ^ m   3 4��
�� 
msng ]  _ ` _ j   6 :�� a�� 
0 button   a m   6 7��
�� 
msng `  b c b j   ; ?�� d�� 0 labelactive1 labelActive1 d m   ; <��
�� 
msng c  e f e j   @ D�� g�� 0 labelactive2 labelActive2 g m   @ A��
�� 
msng f  h i h j   E I�� j�� 0 labelactive3 labelActive3 j m   E F��
�� 
msng i  k l k j   J N�� m�� 0 labelactive4 labelActive4 m m   J K��
�� 
msng l  n o n j   O S�� p��  0 labelinactive1 labelInactive1 p m   O P��
�� 
msng o  q r q j   T X�� s��  0 labelinactive2 labelInactive2 s m   T U��
�� 
msng r  t u t j   Y ]�� v��  0 labelinactive3 labelInactive3 v m   Y Z��
�� 
msng u  w x w j   ^ b�� y��  0 labelinactive4 labelInactive4 y m   ^ _��
�� 
msng x  z { z j   c g�� |�� 0 labelna1 labelNA1 | m   c d��
�� 
msng {  } ~ } j   h l�� �� 0 labelna2 labelNA2  m   h i��
�� 
msng ~  � � � j   m q�� ��� 0 labelna3 labelNA3 � m   m n��
�� 
msng �  � � � j   r v�� ��� 0 labelna4 labelNA4 � m   r s��
�� 
msng �  � � � j   w {�� ��� 0 
pesaledon1 
PESAledON1 � m   w x��
�� 
msng �  � � � j   | ��� ��� 0 
pesaledon2 
PESAledON2 � m   | }��
�� 
msng �  � � � j   � ��� ��� 0 
pesaledoff 
PESAledOFF � m   � ���
�� 
msng �  � � � j   � ��� ��� 0 pesacaution PESAcaution � m   � ���
�� 
msng �  � � � j   � ��� ��� "0 portclosedlabel PortClosedLabel � m   � ���
�� 
msng �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i   � � � � � I      �� ����� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_ �  ��� � o      ���� 0 anotification aNotification��  ��   � l     �� � ���   � R L Insert code here to initialize your application before any files are opened    � � � � �   I n s e r t   c o d e   h e r e   t o   i n i t i a l i z e   y o u r   a p p l i c a t i o n   b e f o r e   a n y   f i l e s   a r e   o p e n e d �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � N H ///////////////////////////////////////////////////////////////////////    � � � � �   / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / �  � � � l     �� � ���   � N H ///////////////////////////      TEST BUTTONS        //////////////////    � � � � �   / / / / / / / / / / / / / / / / / / / / / / / / / / /             T E S T   B U T T O N S                 / / / / / / / / / / / / / / / / / / �  � � � l     �� � ���   � N H ///////////////////////////////////////////////////////////////////////    � � � � �   / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / �  � � � l     ��������  ��  ��   �  � � � i   � � � � � I      �������� 0 init  ��  ��   � k     
 � �  � � � M      � � I      �������� 0 init  ��  ��   �  ��� � L    
 � �  f    	��   �  � � � l     ��������  ��  ��   �  � � � i   � � ��� � I      �������� "0 specialfunction specialFunction��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i   � � � � � I      ����~�� 0 
activecnt1 
activeCnt1�  �~   � k     _ � �  � � � O     � � � I    �} ��|�} 0 
sethidden_ 
setHidden_ �  ��{ � m   	 
�z�z �{  �|   � o     �y�y 0 lednone1 ledNone1 �  � � � O    � � � I    �x ��w�x 0 
sethidden_ 
setHidden_ �  ��v � m    �u�u �v  �w   � o    �t�t 0 ledred1 ledRed1 �  � � � O    / � � � I   ( .�s ��r�s 0 
sethidden_ 
setHidden_ �  ��q � m   ) *�p�p �q  �r   � o     %�o�o  0 labelinactive1 labelInactive1 �  � � � O  0 ? � � � I   8 >�n ��m�n 0 
sethidden_ 
setHidden_ �  ��l � m   9 :�k�k �l  �m   � o   0 5�j�j 0 labelna1 labelNA1 �  � � � O  @ O � � � I   H N�i ��h�i 0 
sethidden_ 
setHidden_ �  ��g � m   I J�f�f  �g  �h   � o   @ E�e�e 0 	ledgreen1 	ledGreen1 �  ��d � O  P _ � � � I   X ^�c ��b�c 0 
sethidden_ 
setHidden_ �  ��a � m   Y Z�`�`  �a  �b   � o   P U�_�_ 0 labelactive1 labelActive1�d   �  � � � l     �^�]�\�^  �]  �\   �  � � � i   � � � � � I      �[�Z�Y�[ 0 
activecntf 
activeCntF�Z  �Y   � k     _ � �  � � � O     � � � I    �X ��W�X 0 
sethidden_ 
setHidden_ �  ��V � m   	 
�U�U �V  �W   � o     �T�T 0 lednone1 ledNone1 �  � � � O    � � � I    �S ��R�S 0 
sethidden_ 
setHidden_ �  �Q  m    �P�P �Q  �R   � o    �O�O 0 	ledgreen1 	ledGreen1 �  O    / I   ( .�N�M�N 0 
sethidden_ 
setHidden_ �L m   ) *�K�K �L  �M   o     %�J�J 0 labelactive1 labelActive1  O  0 ?	
	 I   8 >�I�H�I 0 
sethidden_ 
setHidden_ �G m   9 :�F�F �G  �H  
 o   0 5�E�E 0 labelna1 labelNA1  O  @ O I   H N�D�C�D 0 
sethidden_ 
setHidden_ �B m   I J�A�A  �B  �C   o   @ E�@�@ 0 ledred1 ledRed1 �? O  P _ I   X ^�>�=�> 0 
sethidden_ 
setHidden_ �< m   Y Z�;�;  �<  �=   o   P U�:�:  0 labelinactive1 labelInactive1�?   �  l     �9�8�7�9  �8  �7    i   � � I      �6�5�4�6 0 
activedcdc 
activeDCDC�5  �4   k     _   O    !"! I    �3#�2�3 0 
sethidden_ 
setHidden_# $�1$ m   	 
�0�0 �1  �2  " o     �/�/ 0 lednone2 ledNone2  %&% O   '(' I    �.)�-�. 0 
sethidden_ 
setHidden_) *�,* m    �+�+ �,  �-  ( o    �*�* 0 ledred2 ledRed2& +,+ O    /-.- I   ( .�)/�(�) 0 
sethidden_ 
setHidden_/ 0�'0 m   ) *�&�& �'  �(  . o     %�%�%  0 labelinactive2 labelInactive2, 121 O  0 ?343 I   8 >�$5�#�$ 0 
sethidden_ 
setHidden_5 6�"6 m   9 :�!�! �"  �#  4 o   0 5� �  0 labelna2 labelNA22 787 O  @ O9:9 I   H N�;�� 0 
sethidden_ 
setHidden_; <�< m   I J��  �  �  : o   @ E�� 0 labelactive2 labelActive28 =�= O  P _>?> I   X ^�@�� 0 
sethidden_ 
setHidden_@ A�A m   Y Z��  �  �  ? o   P U�� 0 	ledgreen2 	ledGreen2�   BCB l     ����  �  �  C DED i   � �FGF I      ���� 0 activatedcdcf activateDCDCF�  �  G k     _HH IJI O    KLK I    �M�� 0 
sethidden_ 
setHidden_M N�N m   	 
�� �  �  L o     �
�
 0 lednone2 ledNone2J OPO O   QRQ I    �	S��	 0 
sethidden_ 
setHidden_S T�T m    �� �  �  R o    �� 0 	ledgreen2 	ledGreen2P UVU O    /WXW I   ( .�Y�� 0 
sethidden_ 
setHidden_Y Z�Z m   ) *�� �  �  X o     %� �  0 labelactive2 labelActive2V [\[ O  0 ?]^] I   8 >��_���� 0 
sethidden_ 
setHidden__ `��` m   9 :���� ��  ��  ^ o   0 5���� 0 labelna2 labelNA2\ aba O  @ Ocdc I   H N��e���� 0 
sethidden_ 
setHidden_e f��f m   I J����  ��  ��  d o   @ E���� 0 ledred2 ledRed2b g��g O  P _hih I   X ^��j���� 0 
sethidden_ 
setHidden_j k��k m   Y Z����  ��  ��  i o   P U����  0 labelinactive2 labelInactive2��  E lml l     ��������  ��  ��  m non i   � �pqp I      �������� 0 
activedsrc 
activeDSRC��  ��  q k     _rr sts O    uvu I    ��w���� 0 
sethidden_ 
setHidden_w x��x m   	 
���� ��  ��  v o     ���� 0 lednone3 ledNone3t yzy O   {|{ I    ��}���� 0 
sethidden_ 
setHidden_} ~��~ m    ���� ��  ��  | o    ���� 0 ledred3 ledRed3z � O    /��� I   ( .������� 0 
sethidden_ 
setHidden_� ���� m   ) *���� ��  ��  � o     %����  0 labelinactive3 labelInactive3� ��� O  0 ?��� I   8 >������� 0 
sethidden_ 
setHidden_� ���� m   9 :���� ��  ��  � o   0 5���� 0 labelna3 labelNA3� ��� O  @ O��� I   H N������� 0 
sethidden_ 
setHidden_� ���� m   I J����  ��  ��  � o   @ E���� 0 labelactive3 labelActive3� ���� O  P _��� I   X ^������� 0 
sethidden_ 
setHidden_� ���� m   Y Z����  ��  ��  � o   P U���� 0 	ledgreen3 	ledGreen3��  o ��� l     ��������  ��  ��  � ��� i   � ���� I      �������� 0 activedsrcf activeDSRCF��  ��  � k     _�� ��� O    ��� I    ������� 0 
sethidden_ 
setHidden_� ���� m   	 
���� ��  ��  � o     ���� 0 lednone3 ledNone3� ��� O   ��� I    ������� 0 
sethidden_ 
setHidden_� ���� m    ���� ��  ��  � o    ���� 0 	ledgreen3 	ledGreen3� ��� O    /��� I   ( .������� 0 
sethidden_ 
setHidden_� ���� m   ) *���� ��  ��  � o     %���� 0 labelactive3 labelActive3� ��� O  0 ?��� I   8 >������� 0 
sethidden_ 
setHidden_� ���� m   9 :���� ��  ��  � o   0 5���� 0 labelna3 labelNA3� ��� O  @ O��� I   H N������� 0 
sethidden_ 
setHidden_� ���� m   I J����  ��  ��  � o   @ E���� 0 ledred3 ledRed3� ���� O  P _��� I   X ^������� 0 
sethidden_ 
setHidden_� ���� m   Y Z����  ��  ��  � o   P U����  0 labelinactive3 labelInactive3��  � ��� l     ��������  ��  ��  � ��� i   � ���� I      �������� 0 	activeric 	activeRIC��  ��  � k     _�� ��� O    ��� I    ������� 0 
sethidden_ 
setHidden_� ���� m   	 
���� ��  ��  � o     ���� 0 lednone4 ledNone4� ��� O   ��� I    ������� 0 
sethidden_ 
setHidden_� ���� m    ���� ��  ��  � o    ���� 0 ledred4 ledRed4� ��� O    /��� I   ( .������� 0 
sethidden_ 
setHidden_� ���� m   ) *���� ��  ��  � o     %����  0 labelinactive4 labelInactive4� ��� O  0 ?��� I   8 >������� 0 
sethidden_ 
setHidden_� ���� m   9 :���� ��  ��  � o   0 5���� 0 labelna4 labelNA4� ��� O  @ O��� I   H N������� 0 
sethidden_ 
setHidden_� ���� m   I J����  ��  ��  � o   @ E���� 0 labelactive4 labelActive4� ���� O  P _��� I   X ^������� 0 
sethidden_ 
setHidden_� ���� m   Y Z����  ��  ��  � o   P U���� 0 	ledgreen4 	ledGreen4��  � ��� l     ����~��  �  �~  � ��� i   � ���� I      �}�|�{�} 0 
activericf 
activeRICF�|  �{  � k     _�� ��� O    ��� I    �z��y�z 0 
sethidden_ 
setHidden_� ��x� m   	 
�w�w �x  �y  � o     �v�v 0 lednone4 ledNone4� ��� O   ��� I    �u��t�u 0 
sethidden_ 
setHidden_� ��s� m    �r�r �s  �t  � o    �q�q 0 	ledgreen4 	ledGreen4� ��� O    /� � I   ( .�p�o�p 0 
sethidden_ 
setHidden_ �n m   ) *�m�m �n  �o    o     %�l�l 0 labelactive4 labelActive4�  O  0 ? I   8 >�k�j�k 0 
sethidden_ 
setHidden_ �i m   9 :�h�h �i  �j   o   0 5�g�g 0 labelna4 labelNA4 	
	 O  @ O I   H N�f�e�f 0 
sethidden_ 
setHidden_ �d m   I J�c�c  �d  �e   o   @ E�b�b  0 labelinactive4 labelInactive4
 �a O  P _ I   X ^�`�_�` 0 
sethidden_ 
setHidden_ �^ m   Y Z�]�]  �^  �_   o   P U�\�\ 0 ledred4 ledRed4�a  �  l     �[�Z�Y�[  �Z  �Y    l     �X�X   N H ///////////////////////////////////////////////////////////////////////    � �   / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / /  l     �W�W   N H ///////////////////////////      TEST BUTTONS        //////////////////    � �   / / / / / / / / / / / / / / / / / / / / / / / / / / /             T E S T   B U T T O N S                 / / / / / / / / / / / / / / / / / /  !  l     �V"#�V  " N H ///////////////////////////////////////////////////////////////////////   # �$$ �   / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / /! %&% l     �U�T�S�U  �T  �S  & '(' i   � �)*) I      �R+�Q�R :0 applicationshouldterminate_ applicationShouldTerminate_+ ,�P, o      �O�O 
0 sender  �P  �Q  * k     -- ./. l     �N01�N  0 L F Insert code here to do any housekeeping before your application quits   1 �22 �   I n s e r t   c o d e   h e r e   t o   d o   a n y   h o u s e k e e p i n g   b e f o r e   y o u r   a p p l i c a t i o n   q u i t s/ 3�M3 L     44 n    565 o    �L�L  0 nsterminatenow NSTerminateNow6 m     �K
�K misccura�M  ( 7�J7 l     �I�H�G�I  �H  �G  �J   " 8�F8 l     �E�D�C�E  �D  �C  �F       �B9:�B  9 �A�A 0 	testclass 	TestClass: �@ #;<�@ 0 	testclass 	TestClass; == �?�>>
�? misccura
�> 
pcls> �??  N S O b j e c t< 0�=@�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� �����ABCDEFGHIJKL�=  @ .�����������������
�	��������� ��������������������������������������
� 
pare� 0 	thewindow 	theWindow� 0 cautionicon cautionIcon� 0 cautiontext cautionText� 0 	ledgreen1 	ledGreen1� 0 ledred1 ledRed1� 0 lednone1 ledNone1� 0 	ledgreen2 	ledGreen2� 0 ledred2 ledRed2� 0 lednone2 ledNone2� 0 	ledgreen3 	ledGreen3� 0 ledred3 ledRed3� 0 lednone3 ledNone3� 0 	ledgreen4 	ledGreen4� 0 ledred4 ledRed4� 0 lednone4 ledNone4�
 
0 button  �	 0 labelactive1 labelActive1� 0 labelactive2 labelActive2� 0 labelactive3 labelActive3� 0 labelactive4 labelActive4�  0 labelinactive1 labelInactive1�  0 labelinactive2 labelInactive2�  0 labelinactive3 labelInactive3�  0 labelinactive4 labelInactive4� 0 labelna1 labelNA1�  0 labelna2 labelNA2�� 0 labelna3 labelNA3�� 0 labelna4 labelNA4�� 0 
pesaledon1 
PESAledON1�� 0 
pesaledon2 
PESAledON2�� 0 
pesaledoff 
PESAledOFF�� 0 pesacaution PESAcaution�� "0 portclosedlabel PortClosedLabel�� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_�� 0 init  �� "0 specialfunction specialFunction�� 0 
activecnt1 
activeCnt1�� 0 
activecntf 
activeCntF�� 0 
activedcdc 
activeDCDC�� 0 activatedcdcf activateDCDCF�� 0 
activedsrc 
activeDSRC�� 0 activedsrcf activeDSRCF�� 0 	activeric 	activeRIC�� 0 
activericf 
activeRICF�� :0 applicationshouldterminate_ applicationShouldTerminate_�<  
�; 
msng
�: 
msng
�9 
msng
�8 
msng
�7 
msng
�6 
msng
�5 
msng
�4 
msng
�3 
msng
�2 
msng
�1 
msng
�0 
msng
�/ 
msng
�. 
msng
�- 
msng
�, 
msng
�+ 
msng
�* 
msng
�) 
msng
�( 
msng
�' 
msng
�& 
msng
�% 
msng
�$ 
msng
�# 
msng
�" 
msng
�! 
msng
�  
msng
� 
msng
� 
msng
� 
msng
� 
msng
� 
msngA �� �����MN���� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_�� ��O�� O  ���� 0 anotification aNotification��  M ���� 0 anotification aNotificationN  �� hB �� �����PQ���� 0 init  ��  ��  P  Q ���� 0 init  �� )jd*  O)C ��������RS���� "0 specialfunction specialFunction��  ��  ��  R  S  �� hD �� �����TU���� 0 
activecnt1 
activeCnt1��  ��  T  U ���� 0 
sethidden_ 
setHidden_�� `b   *kk+  UOb   *kk+  UOb   *kk+  UOb   *kk+  UOb   *jk+  UOb   *jk+  UE �� �����VW���� 0 
activecntf 
activeCntF��  ��  V  W ���� 0 
sethidden_ 
setHidden_�� `b   *kk+  UOb   *kk+  UOb   *kk+  UOb   *kk+  UOb   *jk+  UOb   *jk+  UF ������XY���� 0 
activedcdc 
activeDCDC��  ��  X  Y ���� 0 
sethidden_ 
setHidden_�� `b  	 *kk+  UOb   *kk+  UOb   *kk+  UOb   *kk+  UOb   *jk+  UOb   *jk+  UG ��G����Z[���� 0 activatedcdcf activateDCDCF��  ��  Z  [ ���� 0 
sethidden_ 
setHidden_�� `b  	 *kk+  UOb   *kk+  UOb   *kk+  UOb   *kk+  UOb   *jk+  UOb   *jk+  UH ��q����\]���� 0 
activedsrc 
activeDSRC��  ��  \  ] ���� 0 
sethidden_ 
setHidden_�� `b   *kk+  UOb   *kk+  UOb   *kk+  UOb   *kk+  UOb   *jk+  UOb  
 *jk+  UI �������^_���� 0 activedsrcf activeDSRCF��  ��  ^  _ ���� 0 
sethidden_ 
setHidden_�� `b   *kk+  UOb  
 *kk+  UOb   *kk+  UOb   *kk+  UOb   *jk+  UOb   *jk+  UJ �������`a���� 0 	activeric 	activeRIC��  ��  `  a ���� 0 
sethidden_ 
setHidden_�� `b   *kk+  UOb   *kk+  UOb   *kk+  UOb   *kk+  UOb   *jk+  UOb   *jk+  UK �������bc���� 0 
activericf 
activeRICF��  ��  b  c ���� 0 
sethidden_ 
setHidden_�� `b   *kk+  UOb   *kk+  UOb   *kk+  UOb   *kk+  UOb   *jk+  UOb   *jk+  UL ��*����de���� :0 applicationshouldterminate_ applicationShouldTerminate_�� ��f�� f  ���� 
0 sender  ��  d ���� 
0 sender  e ����
�� misccura��  0 nsterminatenow NSTerminateNow�� ��,Eascr  ��ޭ