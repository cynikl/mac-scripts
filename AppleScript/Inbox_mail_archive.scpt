FasdUAS 1.101.10   ��   ��    k             l     ��  ��    ? 9 http://macscripter.net/viewtopic.php?id=40776, thevarium     � 	 	 r   h t t p : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? i d = 4 0 7 7 6 ,   t h e v a r i u m   
  
 l     ��  ��    K E Automatically archive messages in the inbox for one or more accounts     �   �   A u t o m a t i c a l l y   a r c h i v e   m e s s a g e s   i n   t h e   i n b o x   f o r   o n e   o r   m o r e   a c c o u n t s      l     ��  ��      based on their age.     �   (   b a s e d   o n   t h e i r   a g e .      l     ��������  ��  ��        l     ��  ��    6 0 Set this value to the age of messages, in days,     �   `   S e t   t h i s   v a l u e   t o   t h e   a g e   o f   m e s s a g e s ,   i n   d a y s ,      l     ��  ��    #  which should not be archived     �   :   w h i c h   s h o u l d   n o t   b e   a r c h i v e d     !   j     �� "�� 0 
daystosave 
daysToSave " m     ����   !  # $ # l     ��������  ��  ��   $  % & % l     �� ' (��   ' 7 1 Set ARCHIVE_FOLDER to the top level folder where    ( � ) ) b   S e t   A R C H I V E _ F O L D E R   t o   t h e   t o p   l e v e l   f o l d e r   w h e r e &  * + * l     �� , -��   , C = messages should be saved. For mine I created a folder called    - � . . z   m e s s a g e s   s h o u l d   b e   s a v e d .   F o r   m i n e   I   c r e a t e d   a   f o l d e r   c a l l e d +  / 0 / l     �� 1 2��   1 G A Sorted which houses all of the sub folders created by the script    2 � 3 3 �   S o r t e d   w h i c h   h o u s e s   a l l   o f   t h e   s u b   f o l d e r s   c r e a t e d   b y   t h e   s c r i p t 0  4 5 4 j    �� 6�� 0 archivefolder archiveFolder 6 m     7 7 � 8 8  A r c h i v e d / S o r t e d 5  9 : 9 l     ��������  ��  ��   :  ; < ; l     �� = >��   = > 8 This should remain empty and will be assigned the name     > � ? ? p   T h i s   s h o u l d   r e m a i n   e m p t y   a n d   w i l l   b e   a s s i g n e d   t h e   n a m e   <  @ A @ l     �� B C��   B , & of any mailbox you have have selected    C � D D L   o f   a n y   m a i l b o x   y o u   h a v e   h a v e   s e l e c t e d A  E F E j    
�� G�� 0 accountnames accountNames G J    	 H H  I�� I m     J J � K K  ��   F  L M L l     ��������  ��  ��   M  N O N l     �� P Q��   P � �set scriptPath to ("Macintosh HD:Users:YOURUSER:Library:Application Scripts:com.apple.mail") Or another location of your choosing    Q � R R s e t   s c r i p t P a t h   t o   ( " M a c i n t o s h   H D : U s e r s : Y O U R U S E R : L i b r a r y : A p p l i c a t i o n   S c r i p t s : c o m . a p p l e . m a i l " )   O r   a n o t h e r   l o c a t i o n   o f   y o u r   c h o o s i n g O  S T S l     U���� U r      V W V l     X���� X m      Y Y � Z Z ^ B o b : U s e r s : a c o r e : D e s k t o p : I n b o x _ m a i l _ a r c h i v e . s c p t��  ��   W o      ���� 0 
scriptpath 
scriptPath��  ��   T  [ \ [ l    ]���� ] r     ^ _ ^ l    `���� ` I   �� a��
�� .sysoloadscpt        file a 4    �� b
�� 
alis b o    ���� 0 
scriptpath 
scriptPath��  ��  ��   _ o      ���� 0 	thescript 	theScript��  ��   \  c d c l     ��������  ��  ��   d  e f e l  � g���� g O   � h i h k   � j j  k l k l   ��������  ��  ��   l  m n m l   �� o p��   o 8 2 Figure out the earliest date for messages we want    p � q q d   F i g u r e   o u t   t h e   e a r l i e s t   d a t e   f o r   m e s s a g e s   w e   w a n t n  r s r l   �� t u��   t   to leave in the mailbox    u � v v 0   t o   l e a v e   i n   t h e   m a i l b o x s  w x w r    " y z y l     {���� { \      | } | l    ~���� ~ I   ������
�� .misccurdldt    ��� null��  ��  ��  ��   } l    ����  ]     � � � o    ���� 0 
daystosave 
daysToSave � 1    ��
�� 
days��  ��  ��  ��   z o      ���� 0 earliestdate earliestDate x  � � � l  # #��������  ��  ��   �  � � � r   # / � � � l  # ) ����� � n   # ) � � � 1   ' )��
�� 
msbx � 4   # '�� �
�� 
mvwr � m   % &���� ��  ��   � o      ���� 0 accountnames accountNames �  � � � l  0 0��������  ��  ��   �  ��� � X   0� ��� � � k   D� � �  � � � l  D D�� � ���   � / ) Set the Mailbox name of selected mailbox    � � � � R   S e t   t h e   M a i l b o x   n a m e   o f   s e l e c t e d   m a i l b o x �  � � � Q   D W � � � � r   G J � � � o   G H���� 0 anaccountname anAccountName � o      ���� 0 
themailbox 
theMailbox � R      ������
�� .ascrerr ****      � ****��  ��   � k   R W � �  � � � l  R R�� � ���   � J Dlog "Could not archive from " & (name of anAccountName as rich text)    � � � � � l o g   " C o u l d   n o t   a r c h i v e   f r o m   "   &   ( n a m e   o f   a n A c c o u n t N a m e   a s   r i c h   t e x t ) �  ��� � r   R W � � � m   R U��
�� 
null � o      ���� 0 
themailbox 
theMailbox��   �  � � � l  X X��������  ��  ��   �  ��� � Z   X� � ����� � >  X ] � � � o   X Y���� 0 
themailbox 
theMailbox � m   Y \��
�� 
null � k   `� � �  � � � l  ` `�� � ���   � + % Find the messages we want to archive    � � � � J   F i n d   t h e   m e s s a g e s   w e   w a n t   t o   a r c h i v e �  � � � l  ` `�� � ���   � B < In addition to mail older than X number of days it will not    � � � � x   I n   a d d i t i o n   t o   m a i l   o l d e r   t h a n   X   n u m b e r   o f   d a y s   i t   w i l l   n o t �  � � � l  ` `�� � ���   � A ; archive any mail that is unread, flagged or marked as junk    � � � � v   a r c h i v e   a n y   m a i l   t h a t   i s   u n r e a d ,   f l a g g e d   o r   m a r k e d   a s   j u n k �  � � � r   ` � � � � l  ` � ����� � 6 ` � � � � n   ` e � � � 2   a e��
�� 
mssg � o   ` a���� 0 
themailbox 
theMailbox � l  h � ����� � F   h � � � � F   i � � � � F   j  � � � =  k t � � � 1   l p��
�� 
isrd � m   q s��
�� boovtrue � =  u ~ � � � 1   v z��
�� 
isjk � m   { }��
�� boovfals � =  � � � � � 1   � ���
�� 
isfl � m   � ���
�� boovfals � A   � � � � � 1   � ���
�� 
drcv � o   � ����� 0 earliestdate earliestDate��  ��  ��  ��   � o      ���� 0 themessages theMessages �  � � � l  � ���������  ��  ��   �  � � � X   �� ��� � � k   �� � �  � � � l  � ��� � ���   � . ( first we find the sender of the message    � � � � P   f i r s t   w e   f i n d   t h e   s e n d e r   o f   t h e   m e s s a g e �  � � � r   � � � � � c   � � � � � n   � � � � � 1   � ���
�� 
sndr � o   � �����  0 currentmessage currentMessage � m   � ���
�� 
TEXT � o      ���� 0 	thesender 	theSender �  � � � l  � ��� � ���   � F @ now we strip off the sender's domain (everything after the "@")    � � � � �   n o w   w e   s t r i p   o f f   t h e   s e n d e r ' s   d o m a i n   ( e v e r y t h i n g   a f t e r   t h e   " @ " ) �  � � � r   � � � � � n  � � � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr � o      ���� 0 olddelimiters oldDelimiters �  � � � r   � � � � � J   � � � �  �� � m   � � � � � � �  @�   � n      � � � 1   � ��~
�~ 
txdl � 1   � ��}
�} 
ascr �  �  � Q   �^ k   �C  r   � � l  � �	�|�{	 n   � �

 4  � ��z
�z 
citm m   � ��y�y  o   � ��x�x 0 	thesender 	theSender�|  �{   o      �w�w 0 	thedomain 	theDomain  l  � ��v�v   D > always set the text item delimiters back as soon as possible!    � |   a l w a y s   s e t   t h e   t e x t   i t e m   d e l i m i t e r s   b a c k   a s   s o o n   a s   p o s s i b l e !  r   � � m   � � �   n      1   � ��u
�u 
txdl 1   � ��t
�t 
ascr  l  � ��s�s   G A and strip the last character off the domain, as it will be a ">"    � �   a n d   s t r i p   t h e   l a s t   c h a r a c t e r   o f f   t h e   d o m a i n ,   a s   i t   w i l l   b e   a   " > "   Z   �!"�r�q! E   � �#$# o   � ��p�p 0 	thedomain 	theDomain$ m   � �%% �&&  >" r   �
'(' n   �)*) I   ��o+�n�o *0 leftstringfromright leftStringFromRight+ ,-, o   � ��m�m 0 	thedomain 	theDomain- .�l. m   �// �00  >�l  �n  * o   � ��k�k 0 	thescript 	theScript( o      �j�j 0 	thedomain 	theDomain�r  �q    121 T  633 k  144 565 l �i78�i  7 6 0 If the senders domain contains multiple periods   8 �99 `   I f   t h e   s e n d e r s   d o m a i n   c o n t a i n s   m u l t i p l e   p e r i o d s6 :;: l �h<=�h  < 2 , I remove anything to right of any period to   = �>> X   I   r e m o v e   a n y t h i n g   t o   r i g h t   o f   a n y   p e r i o d   t o; ?@? l �gAB�g  A #  capture just the Root domain   B �CC :   c a p t u r e   j u s t   t h e   R o o t   d o m a i n@ D�fD Z  1EF�eGE E  HIH o  �d�d 0 	thedomain 	theDomainI m  JJ �KK  .F r  -LML n  )NON I  )�cP�b�c *0 leftstringfromright leftStringFromRightP QRQ o  "�a�a 0 	thedomain 	theDomainR S�`S m  "%TT �UU  .�`  �b  O o  �_�_ 0 	thescript 	theScriptM o      �^�^ 0 	thedomain 	theDomain�e  G  S  01�f  2 VWV l 77�]XY�]  X 5 / Format the domain so your folders look uniform   Y �ZZ ^   F o r m a t   t h e   d o m a i n   s o   y o u r   f o l d e r s   l o o k   u n i f o r mW [\[ l 77�\]^�\  ]   This is the OCD in me   ^ �__ ,   T h i s   i s   t h e   O C D   i n   m e\ `�[` r  7Caba n 7?cdc I  8?�Ze�Y�Z $0 capitalizestring capitalizeStringe f�Xf o  8;�W�W 0 	thedomain 	theDomain�X  �Y  d o  78�V�V 0 	thescript 	theScriptb o      �U�U 0 	thedomain 	theDomain�[   R      �T�S�R
�T .ascrerr ****      � ****�S  �R   k  K^gg hih l KK�Qjk�Q  j 9 3 If the domain could not be found then it sets the    k �ll f   I f   t h e   d o m a i n   c o u l d   n o t   b e   f o u n d   t h e n   i t   s e t s   t h e  i mnm l KK�Pop�P  o 7 1 domain to Undetermined and archives those emails   p �qq b   d o m a i n   t o   U n d e t e r m i n e d   a n d   a r c h i v e s   t h o s e   e m a i l sn rsr l KK�Otu�O  t 6 0 into one folder. But this could be used to exit   u �vv `   i n t o   o n e   f o l d e r .   B u t   t h i s   c o u l d   b e   u s e d   t o   e x i ts wxw l KK�Nyz�N  y 0 * current loop and leave the messsage alone   z �{{ T   c u r r e n t   l o o p   a n d   l e a v e   t h e   m e s s s a g e   a l o n ex |}| r  KR~~ m  KN�� ���  U n d e t e r m i n e d o      �M�M 0 	thedomain 	theDomain} ��L� r  S^��� m  SV�� ���  � n     ��� 1  Y]�K
�K 
txdl� 1  VY�J
�J 
ascr�L    ��� l __�I�H�G�I  �H  �G  � ��� l __�F���F  � , & Set the archive location based on the   � ��� L   S e t   t h e   a r c h i v e   l o c a t i o n   b a s e d   o n   t h e� ��� r  _p��� l _l��E�D� b  _l��� b  _h��� o  _d�C�C 0 archivefolder archiveFolder� m  dg�� ���  /� o  hk�B�B 0 	thedomain 	theDomain�E  �D  � o      �A�A 0 mailboxname mailboxName� ��� l qq�@���@  � 4 . Find the top level mailbox.  If this does not   � ��� \   F i n d   t h e   t o p   l e v e l   m a i l b o x .     I f   t h i s   d o e s   n o t� ��� l qq�?���?  � 0 * exist, we will get an error and bail out.   � ��� T   e x i s t ,   w e   w i l l   g e t   a n   e r r o r   a n d   b a i l   o u t .� ��� r  q��� 4  q{�>�
�> 
mbxp� o  uz�=�= 0 archivefolder archiveFolder� o      �<�< 0 rootmailbox rootMailbox� ��� l ���;���;  � 9 3 Find the domain archive mailbox.  If this does not   � ��� f   F i n d   t h e   d o m a i n   a r c h i v e   m a i l b o x .     I f   t h i s   d o e s   n o t� ��� l ���:���:  �   exist, we create it.   � ��� *   e x i s t ,   w e   c r e a t e   i t .� ��� Q  ������ r  ����� l ����9�8� n  ����� 4  ���7�
�7 
mbxp� l ����6�5� c  ����� o  ���4�4 0 	thedomain 	theDomain� m  ���3
�3 
TEXT�6  �5  � o  ���2�2 0 rootmailbox rootMailbox�9  �8  � o      �1�1 0 domainmailbox domainMailbox� R      �0�/�.
�0 .ascrerr ****      � ****�/  �.  � k  ���� ��� I ���-�,�
�- .corecrel****      � null�,  � �+��
�+ 
kocl� m  ���*
�* 
mbxp� �)��(
�) 
prdt� K  ���� �'��&
�' 
pnam� l ����%�$� b  ����� b  ����� o  ���#�# 0 archivefolder archiveFolder� m  ���� ���  /� o  ���"�" 0 	thedomain 	theDomain�%  �$  �&  �(  � ��!� r  ����� l ���� �� n  ����� 4  ����
� 
mbxp� l ������ c  ����� o  ���� 0 	thedomain 	theDomain� m  ���
� 
TEXT�  �  � o  ���� 0 rootmailbox rootMailbox�   �  � o      �� 0 domainmailbox domainMailbox�!  � ��� I �����
� .coremovenull���     obj � o  ����  0 currentmessage currentMessage� ���
� 
insh� o  ���� 0 domainmailbox domainMailbox�  � ��� l ������  �  �  �  ��  0 currentmessage currentMessage � o   � ��� 0 themessages theMessages � ��� l �����
�  �  �
  �  ��  ��  ��  �� 0 anaccountname anAccountName � o   3 8�	�	 0 accountnames accountNames��   i m    ���                                                                                  emal  alis    *  Bob                        ����H+     IMail.app                                                        �!΅�        ����  	                Applications    ��߸      ΄��       I  Bob:Applications: Mail.app    M a i l . a p p    B o b  Applications/Mail.app   / ��  ��  ��   f ��� l     ����  �  �  � ��� l     ����  �  �  �       ���  7���  � ���������� 0 
daystosave 
daysToSave�� 0 archivefolder archiveFolder�� 0 accountnames accountNames
�� .aevtoappnull  �   � ****�   � ����� �   J� �����������
�� .aevtoappnull  �   � ****� k    ���  S��  [��  e����  ��  ��  � ������ 0 anaccountname anAccountName��  0 currentmessage currentMessage� 7 Y���������������������������������������������������������� �����%/��JT���������������������������� 0 
scriptpath 
scriptPath
�� 
alis
�� .sysoloadscpt        file�� 0 	thescript 	theScript
�� .misccurdldt    ��� null
�� 
days�� 0 earliestdate earliestDate
�� 
mvwr
�� 
msbx
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 
themailbox 
theMailbox��  ��  
�� 
null
�� 
mssg�  
�� 
isrd
�� 
isjk
�� 
isfl
�� 
drcv�� 0 themessages theMessages
�� 
sndr
�� 
TEXT�� 0 	thesender 	theSender
�� 
ascr
�� 
txdl�� 0 olddelimiters oldDelimiters
�� 
citm�� 0 	thedomain 	theDomain�� *0 leftstringfromright leftStringFromRight�� $0 capitalizestring capitalizeString�� 0 mailboxname mailboxName
�� 
mbxp�� 0 rootmailbox rootMailbox�� 0 domainmailbox domainMailbox
�� 
prdt
�� 
pnam�� 
�� .corecrel****      � null
�� 
insh
�� .coremovenull���     obj ����E�O*��/j E�O��*j b   � E�O*�k/�,Ec  O�b  [��l kh   �E�W X  a E�O�a ��a -a [[[[a ,\Ze8\[a ,\Zf8A\[a ,\Zf8A\[a ,\Z�<A1E` OG_ [��l kh �a ,a &E` O_ a ,E` Oa kv_ a ,FO p_ a  l/E` !Oa "_ a ,FO_ !a # �_ !a $l+ %E` !Y hO &hZ_ !a & �_ !a 'l+ %E` !Y [OY��O�_ !k+ (E` !W X  a )E` !Oa *_ a ,FOb  a +%_ !%E` ,O*a -b  /E` .O _ .a -_ !a &/E` /W :X  *�a -a 0a 1b  a 2%_ !%la 3 4O_ .a -_ !a &/E` /O�a 5_ /l 6OP[OY��OPY h[OY�UUascr  ��ޭ