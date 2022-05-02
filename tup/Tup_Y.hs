{-# OPTIONS_GHC -w #-}
module Tup_Y where
import Tokens
import Tup
import Control.Monad.Error
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,108) ([0,2048,0,256,0,0,0,0,8192,0,4113,0,0,17408,64,8448,0,0,0,8192,0,0,8192,0,1024,0,0,2,0,0,512,0,64,16384,0,512,0,49288,0,6161,0,0,2048,14,0,0,33040,1,0,0,0,0,28,0,16,0,0,16384,0,2048,0,0,0,0,1088,6,0,0,6161,0,0,0,0,0,0,33040,1,1808,0,8,34816,192,32768,3,0,0,24644,0,0,32768,56,16384,0,0,0,16,0,7057,0,0,17408,96,0,0,0,0,1792,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseTup","Prog","Pattern","PatternList","VarTupInner","FuncDecLine","FuncDec","FuncDecs","FuncTest","ExprList","Expr","Oper","ExprTupInner","'#'","'='","'!'","','","'('","')'","'|'","'+'","'*'","'-'","'\\n'","NUM","VAR","%eof"]
        bit_start = st * 29
        bit_end = (st + 1) * 29
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..28]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (26) = happyReduce_18
action_0 (28) = happyShift action_5
action_0 (4) = happyGoto action_6
action_0 (8) = happyGoto action_2
action_0 (9) = happyGoto action_3
action_0 (10) = happyGoto action_4
action_0 _ = happyReduce_18

action_1 (28) = happyShift action_5
action_1 (8) = happyGoto action_2
action_1 (9) = happyGoto action_3
action_1 (10) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (26) = happyShift action_14
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (26) = happyShift action_13
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (26) = happyShift action_12
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (16) = happyShift action_9
action_5 (20) = happyShift action_10
action_5 (28) = happyShift action_11
action_5 (5) = happyGoto action_7
action_5 (6) = happyGoto action_8
action_5 _ = happyReduce_7

action_6 (29) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (16) = happyShift action_9
action_7 (17) = happyReduce_7
action_7 (20) = happyShift action_10
action_7 (22) = happyReduce_7
action_7 (28) = happyShift action_11
action_7 (5) = happyGoto action_7
action_7 (6) = happyGoto action_22
action_7 _ = happyReduce_7

action_8 (17) = happyShift action_20
action_8 (22) = happyShift action_21
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_4

action_10 (28) = happyShift action_19
action_10 (7) = happyGoto action_18
action_10 _ = happyReduce_10

action_11 _ = happyReduce_3

action_12 (18) = happyShift action_17
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (18) = happyShift action_16
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (28) = happyShift action_5
action_14 (8) = happyGoto action_2
action_14 (9) = happyGoto action_15
action_14 _ = happyReduce_15

action_15 _ = happyReduce_13

action_16 (26) = happyShift action_32
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (26) = happyShift action_31
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (21) = happyShift action_30
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (19) = happyShift action_29
action_19 _ = happyReduce_9

action_20 (16) = happyShift action_24
action_20 (20) = happyShift action_25
action_20 (27) = happyShift action_26
action_20 (28) = happyShift action_27
action_20 (13) = happyGoto action_28
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (16) = happyShift action_24
action_21 (20) = happyShift action_25
action_21 (27) = happyShift action_26
action_21 (28) = happyShift action_27
action_21 (13) = happyGoto action_23
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_5

action_23 (17) = happyShift action_44
action_23 (23) = happyShift action_38
action_23 (24) = happyShift action_39
action_23 (25) = happyShift action_40
action_23 (14) = happyGoto action_37
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_27

action_25 (16) = happyShift action_24
action_25 (20) = happyShift action_25
action_25 (27) = happyShift action_26
action_25 (28) = happyShift action_27
action_25 (13) = happyGoto action_42
action_25 (15) = happyGoto action_43
action_25 _ = happyReduce_35

action_26 _ = happyReduce_28

action_27 (20) = happyShift action_41
action_27 _ = happyReduce_24

action_28 (23) = happyShift action_38
action_28 (24) = happyShift action_39
action_28 (25) = happyShift action_40
action_28 (14) = happyGoto action_37
action_28 _ = happyReduce_12

action_29 (28) = happyShift action_19
action_29 (7) = happyGoto action_36
action_29 _ = happyReduce_10

action_30 _ = happyReduce_2

action_31 (28) = happyShift action_35
action_31 (11) = happyGoto action_34
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (26) = happyReduce_18
action_32 (28) = happyShift action_5
action_32 (8) = happyGoto action_2
action_32 (9) = happyGoto action_3
action_32 (10) = happyGoto action_33
action_32 _ = happyReduce_18

action_33 _ = happyReduce_16

action_34 _ = happyReduce_1

action_35 (16) = happyShift action_24
action_35 (20) = happyShift action_25
action_35 (27) = happyShift action_26
action_35 (28) = happyShift action_27
action_35 (12) = happyGoto action_52
action_35 (13) = happyGoto action_53
action_35 _ = happyReduce_22

action_36 _ = happyReduce_8

action_37 (16) = happyShift action_24
action_37 (20) = happyShift action_25
action_37 (27) = happyShift action_26
action_37 (28) = happyShift action_27
action_37 (13) = happyGoto action_51
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_30

action_39 _ = happyReduce_31

action_40 _ = happyReduce_32

action_41 (16) = happyShift action_24
action_41 (20) = happyShift action_25
action_41 (27) = happyShift action_26
action_41 (28) = happyShift action_27
action_41 (13) = happyGoto action_49
action_41 (15) = happyGoto action_50
action_41 _ = happyReduce_35

action_42 (19) = happyShift action_47
action_42 (21) = happyShift action_48
action_42 (23) = happyShift action_38
action_42 (24) = happyShift action_39
action_42 (25) = happyShift action_40
action_42 (14) = happyGoto action_37
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (21) = happyShift action_46
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (16) = happyShift action_24
action_44 (20) = happyShift action_25
action_44 (27) = happyShift action_26
action_44 (28) = happyShift action_27
action_44 (13) = happyGoto action_45
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (23) = happyShift action_38
action_45 (24) = happyShift action_39
action_45 (25) = happyShift action_40
action_45 (14) = happyGoto action_37
action_45 _ = happyReduce_11

action_46 _ = happyReduce_26

action_47 (16) = happyShift action_24
action_47 (20) = happyShift action_25
action_47 (27) = happyShift action_26
action_47 (28) = happyShift action_27
action_47 (13) = happyGoto action_49
action_47 (15) = happyGoto action_57
action_47 _ = happyReduce_35

action_48 _ = happyReduce_25

action_49 (19) = happyShift action_47
action_49 (23) = happyShift action_38
action_49 (24) = happyShift action_39
action_49 (25) = happyShift action_40
action_49 (14) = happyGoto action_37
action_49 _ = happyReduce_34

action_50 (21) = happyShift action_56
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (23) = happyShift action_38
action_51 (24) = happyShift action_39
action_51 (25) = happyShift action_40
action_51 (14) = happyGoto action_37
action_51 _ = happyReduce_29

action_52 (17) = happyShift action_55
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (16) = happyShift action_24
action_53 (17) = happyReduce_22
action_53 (20) = happyShift action_25
action_53 (23) = happyShift action_38
action_53 (24) = happyShift action_39
action_53 (25) = happyShift action_40
action_53 (27) = happyShift action_26
action_53 (28) = happyShift action_27
action_53 (12) = happyGoto action_54
action_53 (13) = happyGoto action_53
action_53 (14) = happyGoto action_37
action_53 _ = happyReduce_22

action_54 _ = happyReduce_20

action_55 (16) = happyShift action_24
action_55 (20) = happyShift action_25
action_55 (27) = happyShift action_26
action_55 (28) = happyShift action_27
action_55 (13) = happyGoto action_58
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_23

action_57 _ = happyReduce_33

action_58 (23) = happyShift action_38
action_58 (24) = happyShift action_39
action_58 (25) = happyShift action_40
action_58 (14) = happyGoto action_37
action_58 _ = happyReduce_19

happyReduce_1 = happyReduce 5 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Prog happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Tup_Var happy_var_2
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyTerminal (TupLabel happy_var_1))
	 =  HappyAbsSyn5
		 (PatVar happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn5
		 (Null_Pat Null
	)

happyReduce_5 = happySpecReduce_2  6 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_0  6 happyReduction_7
happyReduction_7  =  HappyAbsSyn6
		 ([]
	)

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TupLabel happy_var_1))
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyTerminal (TupLabel happy_var_1))
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_0  7 happyReduction_10
happyReduction_10  =  HappyAbsSyn7
		 ([]
	)

happyReduce_11 = happyReduce 6 8 happyReduction_11
happyReduction_11 ((HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	(HappyTerminal (TupLabel happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (FuncDecLine happy_var_1 happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 4 8 happyReduction_12
happyReduction_12 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	(HappyTerminal (TupLabel happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (FuncDecLine happy_var_1 happy_var_2 (Null_Expr Null) happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_3  9 happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_0  9 happyReduction_15
happyReduction_15  =  HappyAbsSyn9
		 ([ ]
	)

happyReduce_16 = happyReduce 5 10 happyReduction_16
happyReduction_16 ((HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (happy_var_1 : happy_var_5
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_0  10 happyReduction_18
happyReduction_18  =  HappyAbsSyn10
		 ([ ]
	)

happyReduce_19 = happyReduce 4 11 happyReduction_19
happyReduction_19 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	(HappyTerminal (TupLabel happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (FuncTest happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_2  12 happyReduction_20
happyReduction_20 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  12 happyReduction_21
happyReduction_21 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_0  12 happyReduction_22
happyReduction_22  =  HappyAbsSyn12
		 ([]
	)

happyReduce_23 = happyReduce 4 13 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TupLabel happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Func_Call happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_1  13 happyReduction_24
happyReduction_24 (HappyTerminal (TupLabel happy_var_1))
	 =  HappyAbsSyn13
		 (Var_Expr happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Tup_Expr happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  13 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn13
		 (Null_Expr Null
	)

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 (HappyTerminal (TupInt happy_var_1))
	 =  HappyAbsSyn13
		 (Int_Expr happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  13 happyReduction_29
happyReduction_29 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Op_Expr happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  14 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn14
		 (Add
	)

happyReduce_31 = happySpecReduce_1  14 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn14
		 (Mul
	)

happyReduce_32 = happySpecReduce_1  14 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn14
		 (Sub
	)

happyReduce_33 = happySpecReduce_3  15 happyReduction_33
happyReduction_33 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  15 happyReduction_34
happyReduction_34 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn15
		 ([happy_var_1]
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_0  15 happyReduction_35
happyReduction_35  =  HappyAbsSyn15
		 ([ ]
	)

happyNewToken action sts stk [] =
	action 29 29 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TupNull -> cont 16;
	TupEquals -> cont 17;
	TupExclam -> cont 18;
	TupComma -> cont 19;
	TupLParen -> cont 20;
	TupRParen -> cont 21;
	TupPipe -> cont 22;
	TupAdd -> cont 23;
	TupMul -> cont 24;
	TupSub -> cont 25;
	TupEndl -> cont 26;
	TupInt happy_dollar_dollar -> cont 27;
	TupLabel happy_dollar_dollar -> cont 28;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 29 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseTup tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError tks = error ("Parse error: " ++ show tks)
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc1900_0/ghc_2.h" #-}


























































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 147 "templates\\\\GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates\\\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates\\\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
