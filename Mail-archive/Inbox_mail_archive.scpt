FasdUAS 1.101.10   ��   ��    k             l     ��  ��    ? 9 http://macscripter.net/viewtopic.php?id=40776, thevarium     � 	 	 r   h t t p : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? i d = 4 0 7 7 6 ,   t h e v a r i u m   
  
 l     ��  ��    K E Automatically archive messages in the inbox for one or more accounts     �   �   A u t o m a t i c a l l y   a r c h i v e   m e s s a g e s   i n   t h e   i n b o x   f o r   o n e   o r   m o r e   a c c o u n t s      l     ��  ��      based on their age.     �   (   b a s e d   o n   t h e i r   a g e .      l     ��  ��    9 3 With some changes-simplifications by Cyril Niklaus     �   f   W i t h   s o m e   c h a n g e s - s i m p l i f i c a t i o n s   b y   C y r i l   N i k l a u s      l     ��������  ��  ��        l     ��  ��    6 0 Set this value to the age of messages, in days,     �   `   S e t   t h i s   v a l u e   t o   t h e   a g e   o f   m e s s a g e s ,   i n   d a y s ,     !   l     �� " #��   " #  which should not be archived    # � $ $ :   w h i c h   s h o u l d   n o t   b e   a r c h i v e d !  % & % j     �� '�� 0 
daystosave 
daysToSave ' m     ���� - &  ( ) ( l     ��������  ��  ��   )  * + * l     �� , -��   , 7 1 Set ARCHIVE_FOLDER to the top level folder where    - � . . b   S e t   A R C H I V E _ F O L D E R   t o   t h e   t o p   l e v e l   f o l d e r   w h e r e +  / 0 / l     �� 1 2��   1 H B messages should be saved. There is no need to add On My Mac here.    2 � 3 3 �   m e s s a g e s   s h o u l d   b e   s a v e d .   T h e r e   i s   n o   n e e d   t o   a d d   O n   M y   M a c   h e r e . 0  4 5 4 j    �� 6�� 0 archivefolder archiveFolder 6 m     7 7 � 8 8  A r c h i v e d / S o r t e d 5  9 : 9 l     ��������  ��  ��   :  ; < ; l     �� = >��   = > 8 This should remain empty and will be assigned the name     > � ? ? p   T h i s   s h o u l d   r e m a i n   e m p t y   a n d   w i l l   b e   a s s i g n e d   t h e   n a m e   <  @ A @ l     �� B C��   B , & of any mailbox you have have selected    C � D D L   o f   a n y   m a i l b o x   y o u   h a v e   h a v e   s e l e c t e d A  E F E j    
�� G�� 0 accountnames accountNames G J    	 H H  I�� I m     J J � K K  ��   F  L M L l     ��������  ��  ��   M  N O N l     �� P Q��   P   Modify this    Q � R R    M o d i f y   t h i s O  S T S l     U���� U r      V W V l     X���� X m      Y Y � Z Z � M a c i n t o s h   H D : U s e r s : Y O U R U S E R : L i b r a r y : A p p l i c a t i o n   S c r i p t s : c o m . a p p l e . m a i l : s t r i n g t e m p . s c p t��  ��   W o      ���� 0 
scriptpath 
scriptPath��  ��   T  [ \ [ l    ]���� ] r     ^ _ ^ l    `���� ` I   �� a��
�� .sysoloadscpt        file a 4    �� b
�� 
alis b o    ���� 0 
scriptpath 
scriptPath��  ��  ��   _ o      ���� 0 	thescript 	theScript��  ��   \  c d c l     ��������  ��  ��   d  e f e l  G g���� g O   G h i h k   F j j  k l k l   ��������  ��  ��   l  m n m l   �� o p��   o 8 2 Figure out the earliest date for messages we want    p � q q d   F i g u r e   o u t   t h e   e a r l i e s t   d a t e   f o r   m e s s a g e s   w e   w a n t n  r s r l   �� t u��   t   to leave in the mailbox    u � v v 0   t o   l e a v e   i n   t h e   m a i l b o x s  w x w r    " y z y l     {���� { \      | } | l    ~���� ~ I   ������
�� .misccurdldt    ��� null��  ��  ��  ��   } l    ����  ]     � � � o    ���� 0 
daystosave 
daysToSave � 1    ��
�� 
days��  ��  ��  ��   z o      ���� 0 earliestdate earliestDate x  � � � l  # #��������  ��  ��   �  � � � r   # / � � � l  # ) ����� � n   # ) � � � 1   ' )��
�� 
msbx � 4   # '�� �
�� 
mvwr � m   % &���� ��  ��   � o      ���� 0 accountnames accountNames �  � � � l  0 0��������  ��  ��   �  ��� � X   0F ��� � � k   DA � �  � � � l  D D�� � ���   � / ) Set the Mailbox name of selected mailbox    � � � � R   S e t   t h e   M a i l b o x   n a m e   o f   s e l e c t e d   m a i l b o x �  � � � Q   D W � � � � r   G J � � � o   G H���� 0 anaccountname anAccountName � o      ���� 0 
themailbox 
theMailbox � R      ������
�� .ascrerr ****      � ****��  ��   � k   R W � �  � � � l  R R�� � ���   � J Dlog "Could not archive from " & (name of anAccountName as rich text)    � � � � � l o g   " C o u l d   n o t   a r c h i v e   f r o m   "   &   ( n a m e   o f   a n A c c o u n t N a m e   a s   r i c h   t e x t ) �  ��� � r   R W � � � m   R U��
�� 
null � o      ���� 0 
themailbox 
theMailbox��   �  � � � l  X X��������  ��  ��   �  ��� � Z   XA � ����� � >  X ] � � � o   X Y���� 0 
themailbox 
theMailbox � m   Y \��
�� 
null � k   `= � �  � � � l  ` `�� � ���   � + % Find the messages we want to archive    � � � � J   F i n d   t h e   m e s s a g e s   w e   w a n t   t o   a r c h i v e �  � � � l  ` `�� � ���   � B < In addition to mail older than X number of days it will not    � � � � x   I n   a d d i t i o n   t o   m a i l   o l d e r   t h a n   X   n u m b e r   o f   d a y s   i t   w i l l   n o t �  � � � l  ` `�� � ���   � A ; archive any mail that is unread, flagged or marked as junk    � � � � v   a r c h i v e   a n y   m a i l   t h a t   i s   u n r e a d ,   f l a g g e d   o r   m a r k e d   a s   j u n k �  � � � r   ` � � � � l  ` � ����� � 6 ` � � � � n   ` e � � � 2   a e��
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
drcv � o   � ����� 0 earliestdate earliestDate��  ��  ��  ��   � o      ���� 0 themessages theMessages �  � � � l  � ���������  ��  ��   �  � � � X   �; ��� � � k   �6 � �  � � � l   � ��� � ���   ���-- first we find the sender of the message				set theSender to sender of currentMessage as string				-- now we strip off the sender's domain (everything after the "@")				set oldDelimiters to AppleScript's text item delimiters				set AppleScript's text item delimiters to {"@"}				try					set theDomain to the second text item of theSender					-- always set the text item delimiters back as soon as possible!					set AppleScript's text item delimiters to ""					-- and strip the last character off the domain, as it will be a ">"					if theDomain contains ">" then						set theDomain to leftStringFromRight(theDomain, ">") of theScript					end if					repeat						-- If the senders domain contains multiple periods						-- I remove anything to right of any period to						-- capture just the Root domain						if theDomain contains "." then							set theDomain to leftStringFromRight(theDomain, ".") of theScript						else							exit repeat						end if					end repeat					-- Format the domain so your folders look uniform					-- This is the OCD in me					set theDomain to theScript's capitalizeString(theDomain)				on error					-- If the domain could not be found then it sets the 					-- domain to Undetermined and archives those emails					-- into one folder. But this could be used to exit					-- current loop and leave the messsage alone					set theDomain to "Undetermined"					set AppleScript's text item delimiters to ""				end try     � � � �z - -   f i r s t   w e   f i n d   t h e   s e n d e r   o f   t h e   m e s s a g e  	 	 	 	 s e t   t h e S e n d e r   t o   s e n d e r   o f   c u r r e n t M e s s a g e   a s   s t r i n g  	 	 	 	 - -   n o w   w e   s t r i p   o f f   t h e   s e n d e r ' s   d o m a i n   ( e v e r y t h i n g   a f t e r   t h e   " @ " )  	 	 	 	 s e t   o l d D e l i m i t e r s   t o   A p p l e S c r i p t ' s   t e x t   i t e m   d e l i m i t e r s  	 	 	 	 s e t   A p p l e S c r i p t ' s   t e x t   i t e m   d e l i m i t e r s   t o   { " @ " }  	 	 	 	 t r y  	 	 	 	 	 s e t   t h e D o m a i n   t o   t h e   s e c o n d   t e x t   i t e m   o f   t h e S e n d e r  	 	 	 	 	 - -   a l w a y s   s e t   t h e   t e x t   i t e m   d e l i m i t e r s   b a c k   a s   s o o n   a s   p o s s i b l e !  	 	 	 	 	 s e t   A p p l e S c r i p t ' s   t e x t   i t e m   d e l i m i t e r s   t o   " "  	 	 	 	 	 - -   a n d   s t r i p   t h e   l a s t   c h a r a c t e r   o f f   t h e   d o m a i n ,   a s   i t   w i l l   b e   a   " > "  	 	 	 	 	 i f   t h e D o m a i n   c o n t a i n s   " > "   t h e n  	 	 	 	 	 	 s e t   t h e D o m a i n   t o   l e f t S t r i n g F r o m R i g h t ( t h e D o m a i n ,   " > " )   o f   t h e S c r i p t  	 	 	 	 	 e n d   i f  	 	 	 	 	 r e p e a t  	 	 	 	 	 	 - -   I f   t h e   s e n d e r s   d o m a i n   c o n t a i n s   m u l t i p l e   p e r i o d s  	 	 	 	 	 	 - -   I   r e m o v e   a n y t h i n g   t o   r i g h t   o f   a n y   p e r i o d   t o  	 	 	 	 	 	 - -   c a p t u r e   j u s t   t h e   R o o t   d o m a i n  	 	 	 	 	 	 i f   t h e D o m a i n   c o n t a i n s   " . "   t h e n  	 	 	 	 	 	 	 s e t   t h e D o m a i n   t o   l e f t S t r i n g F r o m R i g h t ( t h e D o m a i n ,   " . " )   o f   t h e S c r i p t  	 	 	 	 	 	 e l s e  	 	 	 	 	 	 	 e x i t   r e p e a t  	 	 	 	 	 	 e n d   i f  	 	 	 	 	 e n d   r e p e a t  	 	 	 	 	 - -   F o r m a t   t h e   d o m a i n   s o   y o u r   f o l d e r s   l o o k   u n i f o r m  	 	 	 	 	 - -   T h i s   i s   t h e   O C D   i n   m e  	 	 	 	 	 s e t   t h e D o m a i n   t o   t h e S c r i p t ' s   c a p i t a l i z e S t r i n g ( t h e D o m a i n )  	 	 	 	 o n   e r r o r  	 	 	 	 	 - -   I f   t h e   d o m a i n   c o u l d   n o t   b e   f o u n d   t h e n   i t   s e t s   t h e    	 	 	 	 	 - -   d o m a i n   t o   U n d e t e r m i n e d   a n d   a r c h i v e s   t h o s e   e m a i l s  	 	 	 	 	 - -   i n t o   o n e   f o l d e r .   B u t   t h i s   c o u l d   b e   u s e d   t o   e x i t  	 	 	 	 	 - -   c u r r e n t   l o o p   a n d   l e a v e   t h e   m e s s s a g e   a l o n e  	 	 	 	 	 s e t   t h e D o m a i n   t o   " U n d e t e r m i n e d "  	 	 	 	 	 s e t   A p p l e S c r i p t ' s   t e x t   i t e m   d e l i m i t e r s   t o   " "  	 	 	 	 e n d   t r y   �  � � � l  � ��� � ���   � , & Set the archive location based on the    � � � � L   S e t   t h e   a r c h i v e   l o c a t i o n   b a s e d   o n   t h e �  � � � l  � ��� � ���   � + % modified this to not sort by sender.    � � � � J   m o d i f i e d   t h i s   t o   n o t   s o r t   b y   s e n d e r . �  � � � r   � � � � � l  � � ����� � I  � �������
�� .misccurdldt    ��� null��  ��  ��  ��   � o      ���� 0 	thedomain 	theDomain �  � � � r   � � � � � l  � � ���~ � b   � � � � � b   � � � � � o   � ��}�} 0 archivefolder archiveFolder � m   � � � � � � �  / � o   � ��|�| 0 	thedomain 	theDomain�  �~   � o      �{�{ 0 mailboxname mailboxName �  � � � l  � ��z � ��z   � 4 . Find the top level mailbox.  If this does not    � �   \   F i n d   t h e   t o p   l e v e l   m a i l b o x .     I f   t h i s   d o e s   n o t �  l  � ��y�y   0 * exist, we will get an error and bail out.    � T   e x i s t ,   w e   w i l l   g e t   a n   e r r o r   a n d   b a i l   o u t .  r   � �	 4   � ��x

�x 
mbxp
 o   � ��w�w 0 archivefolder archiveFolder	 o      �v�v 0 rootmailbox rootMailbox  l  � ��u�u   9 3 Find the domain archive mailbox.  If this does not    � f   F i n d   t h e   d o m a i n   a r c h i v e   m a i l b o x .     I f   t h i s   d o e s   n o t  l  � ��t�t     exist, we create it.    � *   e x i s t ,   w e   c r e a t e   i t .  Q   �( r   � � l  � ��s�r n   � � 4   � ��q
�q 
mbxp l  � � �p�o  c   � �!"! o   � ��n�n 0 	thedomain 	theDomain" m   � ��m
�m 
TEXT�p  �o   o   � ��l�l 0 rootmailbox rootMailbox�s  �r   o      �k�k 0 domainmailbox domainMailbox R      �j�i�h
�j .ascrerr ****      � ****�i  �h   k   �(## $%$ I  ��g�f&
�g .corecrel****      � null�f  & �e'(
�e 
kocl' m   � ��d
�d 
mbxp( �c)�b
�c 
prdt) K   �** �a+�`
�a 
pnam+ l  ,�_�^, b   -.- b   	/0/ o   �]�] 0 archivefolder archiveFolder0 m  11 �22  /. o  	�\�\ 0 	thedomain 	theDomain�_  �^  �`  �b  % 3�[3 r  (454 l $6�Z�Y6 n  $787 4  $�X9
�X 
mbxp9 l #:�W�V: c  #;<; o  �U�U 0 	thedomain 	theDomain< m  "�T
�T 
TEXT�W  �V  8 o  �S�S 0 rootmailbox rootMailbox�Z  �Y  5 o      �R�R 0 domainmailbox domainMailbox�[   =>= I )4�Q?@
�Q .coremovenull���     obj ? o  )*�P�P  0 currentmessage currentMessage@ �OA�N
�O 
inshA o  -0�M�M 0 domainmailbox domainMailbox�N  > B�LB l 55�K�J�I�K  �J  �I  �L  ��  0 currentmessage currentMessage � o   � ��H�H 0 themessages theMessages � C�GC l <<�F�E�D�F  �E  �D  �G  ��  ��  ��  �� 0 anaccountname anAccountName � o   3 8�C�C 0 accountnames accountNames��   i m    DD�                                                                                  emal  alis    *  Ode                        ��H+     $Mail.app                                                          y�ir        ����  	                Applications    ���      �iU�       $  Ode:Applications: Mail.app    M a i l . a p p    O d e  Applications/Mail.app   / ��  ��  ��   f EFE l     �B�A�@�B  �A  �@  F G�?G l     �>�=�<�>  �=  �<  �?       �;H�: 7IJ�;  H �9�8�7�6�9 0 
daystosave 
daysToSave�8 0 archivefolder archiveFolder�7 0 accountnames accountNames
�6 .aevtoappnull  �   � ****�: -I �5K�5 K   JJ �4L�3�2MN�1
�4 .aevtoappnull  �   � ****L k    GOO  SPP  [QQ  e�0�0  �3  �2  M �/�.�/ 0 anaccountname anAccountName�.  0 currentmessage currentMessageN ' Y�-�,�+�*D�)�(�'�&�%�$�#�"�!� ���R������ ��������1�����- 0 
scriptpath 
scriptPath
�, 
alis
�+ .sysoloadscpt        file�* 0 	thescript 	theScript
�) .misccurdldt    ��� null
�( 
days�' 0 earliestdate earliestDate
�& 
mvwr
�% 
msbx
�$ 
kocl
�# 
cobj
�" .corecnte****       ****�! 0 
themailbox 
theMailbox�   �  
� 
null
� 
mssgR  
� 
isrd
� 
isjk
� 
isfl
� 
drcv� 0 themessages theMessages� 0 	thedomain 	theDomain� 0 mailboxname mailboxName
� 
mbxp� 0 rootmailbox rootMailbox
� 
TEXT� 0 domainmailbox domainMailbox
� 
prdt
� 
pnam� 
� .corecrel****      � null
� 
insh
� .coremovenull���     obj �1H�E�O*��/j E�O�5*j b   � E�O*�k/�,Ec  Ob  [��l kh   �E�W X  a E�O�a  ��a -a [[[[a ,\Ze8\[a ,\Zf8A\[a ,\Zf8A\[a ,\Z�<A1E` O �_ [��l kh *j E` Ob  a %_ %E` O*a b  /E` O _ a _ a &/E` W :X  *�a a  a !b  a "%_ %la # $O_ a _ a &/E` O�a %_ l &OP[OY�qOPY h[OY��Uascr  ��ޭ