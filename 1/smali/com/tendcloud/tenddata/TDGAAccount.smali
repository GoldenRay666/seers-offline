.class public final Lcom/tendcloud/tenddata/TDGAAccount;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tendcloud/tenddata/TDGAAccount$a;,
        Lcom/tendcloud/tenddata/TDGAAccount$Gender;,
        Lcom/tendcloud/tenddata/TDGAAccount$AccountType;
    }
.end annotation


# static fields
.field public static a:Lcom/tendcloud/tenddata/TDGAAccount; = null

.field private static final l:Ljava/lang/String; = "accountId"

.field private static final m:Ljava/lang/String; = "userLevel"

.field private static final n:Ljava/lang/String; = "gender"

.field private static final o:Ljava/lang/String; = "accountName"

.field private static final p:Ljava/lang/String; = "age"

.field private static final q:Ljava/lang/String; = "accountType"

.field private static final r:Ljava/lang/String; = "account_file"

.field private static final s:Ljava/lang/String; = "levelup_duration"

.field private static final t:Ljava/lang/String; = "game_duration"

.field private static final u:Ljava/lang/String; = "mission_duration"

.field private static final v:I


# instance fields
.field b:Ljava/lang/String;

.field c:Lcom/tendcloud/tenddata/TDGAAccount$AccountType;

.field d:Ljava/lang/String;

.field e:I

.field f:Lcom/tendcloud/tenddata/TDGAAccount$Gender;

.field g:I

.field h:Ljava/lang/String;

.field public i:J

.field public j:Ljava/util/concurrent/atomic/AtomicLong;

.field k:J


# direct methods
.method protected constructor <init>()V
    .locals 4

    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount$AccountType;->ANONYMOUS:Lcom/tendcloud/tenddata/TDGAAccount$AccountType;

    iput-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->c:Lcom/tendcloud/tenddata/TDGAAccount$AccountType;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->d:Ljava/lang/String;

    iput v1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->e:I

    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount$Gender;->UNKNOW:Lcom/tendcloud/tenddata/TDGAAccount$Gender;

    iput-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->f:Lcom/tendcloud/tenddata/TDGAAccount$Gender;

    iput v1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->g:I

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    iput-wide v2, p0, Lcom/tendcloud/tenddata/TDGAAccount;->i:J

    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->j:Ljava/util/concurrent/atomic/AtomicLong;

    iput-wide v2, p0, Lcom/tendcloud/tenddata/TDGAAccount;->k:J

    return-void
.end method

.method static final a(Landroid/content/Context;)Lcom/tendcloud/tenddata/TDGAAccount;
    .locals 2

    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/tendcloud/tenddata/TDGAAccount;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/tendcloud/tenddata/TDGAAccount;

    move-result-object v0

    return-object v0
.end method

.method static final a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/tendcloud/tenddata/TDGAAccount;
    .locals 6

    const/4 v4, 0x0

    invoke-static {p0, p1, p2}, Lcom/tendcloud/tenddata/TDGAAccount;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-direct {v1}, Lcom/tendcloud/tenddata/TDGAAccount;-><init>()V

    iput-object p1, v1, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    iput-object p2, v1, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    if-eqz v0, :cond_1

    const-string v2, "accountType"

    sget-object v3, Lcom/tendcloud/tenddata/TDGAAccount$AccountType;->ANONYMOUS:Lcom/tendcloud/tenddata/TDGAAccount$AccountType;

    invoke-virtual {v3}, Lcom/tendcloud/tenddata/TDGAAccount$AccountType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/tendcloud/tenddata/TDGAAccount$AccountType;->valueOf(Ljava/lang/String;)Lcom/tendcloud/tenddata/TDGAAccount$AccountType;

    move-result-object v2

    iput-object v2, v1, Lcom/tendcloud/tenddata/TDGAAccount;->c:Lcom/tendcloud/tenddata/TDGAAccount$AccountType;

    const-string v2, "accountName"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tendcloud/tenddata/TDGAAccount;->d:Ljava/lang/String;

    const-string v2, "userLevel"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lcom/tendcloud/tenddata/TDGAAccount;->e:I

    const-string v2, "age"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lcom/tendcloud/tenddata/TDGAAccount;->g:I

    const-string v2, "gender"

    sget-object v3, Lcom/tendcloud/tenddata/TDGAAccount$Gender;->UNKNOW:Lcom/tendcloud/tenddata/TDGAAccount$Gender;

    invoke-virtual {v3}, Lcom/tendcloud/tenddata/TDGAAccount$Gender;->name()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/tendcloud/tenddata/TDGAAccount$Gender;->valueOf(Ljava/lang/String;)Lcom/tendcloud/tenddata/TDGAAccount$Gender;

    move-result-object v2

    iput-object v2, v1, Lcom/tendcloud/tenddata/TDGAAccount;->f:Lcom/tendcloud/tenddata/TDGAAccount$Gender;

    const-string v2, "game_duration"

    const-wide/16 v3, 0x0

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    :cond_0
    iget-object v0, v1, Lcom/tendcloud/tenddata/TDGAAccount;->j:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    iget-object v0, v1, Lcom/tendcloud/tenddata/TDGAAccount;->j:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, v4, v5, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v1}, Lcom/tendcloud/tenddata/TDGAAccount;->c()V

    :cond_1
    return-object v1
.end method

.method static final a(Landroid/content/Context;Lcom/tendcloud/tenddata/TDGAAccount;)V
    .locals 3

    iget-object v0, p1, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    iget-object v1, p1, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    invoke-static {p0, v0, v1}, Lcom/tendcloud/tenddata/TDGAAccount;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "accountId"

    iget-object v2, p1, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "accountType"

    iget-object v2, p1, Lcom/tendcloud/tenddata/TDGAAccount;->c:Lcom/tendcloud/tenddata/TDGAAccount$AccountType;

    invoke-virtual {v2}, Lcom/tendcloud/tenddata/TDGAAccount$AccountType;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "accountName"

    iget-object v2, p1, Lcom/tendcloud/tenddata/TDGAAccount;->d:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "userLevel"

    iget v2, p1, Lcom/tendcloud/tenddata/TDGAAccount;->e:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const-string v1, "age"

    iget v2, p1, Lcom/tendcloud/tenddata/TDGAAccount;->g:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const-string v1, "gender"

    iget-object v2, p1, Lcom/tendcloud/tenddata/TDGAAccount;->f:Lcom/tendcloud/tenddata/TDGAAccount$Gender;

    invoke-virtual {v2}, Lcom/tendcloud/tenddata/TDGAAccount$Gender;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    return-void
.end method

.method private static final b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "|"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "account_file"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private final d()J
    .locals 7

    const-wide/16 v0, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "TDGAAccount.getLevelUpDuration() called."

    aput-object v3, v2, v4

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->a()Landroid/content/Context;

    move-result-object v2

    if-nez v2, :cond_0

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "TalkingDataGA.getContext() == null."

    aput-object v3, v2, v4

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->b()J

    move-result-wide v3

    iget-object v5, p0, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    iget-object v6, p0, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    invoke-static {v2, v5, v6}, Lcom/tendcloud/tenddata/TDGAAccount;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v5, "levelup_duration"

    invoke-interface {v2, v5, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v5, "levelup_duration"

    invoke-interface {v2, v5, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    sub-long v0, v3, v0

    goto :goto_0
.end method

.method private final e()V
    .locals 3

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/tendcloud/tenddata/TDGAAccount;->a(Landroid/content/Context;Lcom/tendcloud/tenddata/TDGAAccount;)V

    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/tendcloud/tenddata/game/q;

    sget-object v2, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    invoke-direct {v1, v2, p0}, Lcom/tendcloud/tenddata/game/q;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;)V

    const/16 v2, 0xd

    invoke-static {v0, v2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method private final f()V
    .locals 3

    iget-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    iget-object v1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/tendcloud/tenddata/game/r;->a(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/tendcloud/tenddata/TDGAAccount;->a(Landroid/content/Context;Lcom/tendcloud/tenddata/TDGAAccount;)V

    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0xe

    invoke-virtual {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-static {v1, v2, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public static setAccount(Ljava/lang/String;)Lcom/tendcloud/tenddata/TDGAAccount;
    .locals 6

    const/4 v0, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-array v1, v5, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TDGAAccount.setAccount Called="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v1

    if-nez v1, :cond_0

    new-array v1, v5, [Ljava/lang/String;

    const-string v2, "SDK not initialized. TDGAAccount.setAccount()"

    aput-object v2, v1, v4

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-array v1, v5, [Ljava/lang/String;

    const-string v2, "set accountid is null, please check it."

    aput-object v2, v1, v4

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    iget-object v0, v0, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    iput-object p0, v0, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    :goto_1
    sget-object v1, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/tendcloud/tenddata/TDGAAccount;->a(Landroid/content/Context;Lcom/tendcloud/tenddata/TDGAAccount;)V

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/r;->b(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    iget-object v0, v0, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v1

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {v2, p0, v0}, Lcom/tendcloud/tenddata/TDGAAccount;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/tendcloud/tenddata/TDGAAccount;

    move-result-object v0

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-virtual {v2}, Lcom/tendcloud/tenddata/TDGAAccount;->a()V

    new-instance v2, Lcom/tendcloud/tenddata/TDGAAccount$a;

    invoke-direct {v2}, Lcom/tendcloud/tenddata/TDGAAccount$a;-><init>()V

    sget-object v3, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    iput-object v3, v2, Lcom/tendcloud/tenddata/TDGAAccount$a;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    iput-object v0, v2, Lcom/tendcloud/tenddata/TDGAAccount$a;->b:Lcom/tendcloud/tenddata/TDGAAccount;

    sput-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    const/16 v3, 0xc

    invoke-static {v1, v3, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1
.end method


# virtual methods
.method public final a()V
    .locals 6

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "TDGAAccount.updateGameDuration() called."

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->a()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "TalkingDataGA.getContext() == null."

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->j:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    invoke-virtual {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->b()J

    move-result-wide v3

    iget-object v5, p0, Lcom/tendcloud/tenddata/TDGAAccount;->j:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5, v1, v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/tendcloud/tenddata/TDGAAccount;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "game_duration"

    iget-object v2, p0, Lcom/tendcloud/tenddata/TDGAAccount;->j:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-virtual {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->c()V

    goto :goto_0
.end method

.method final a(Ljava/lang/String;)V
    .locals 7

    const/4 v6, 0x1

    const/4 v5, 0x0

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->a()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "TalkingDataGA.getContext() == null."

    aput-object v1, v0, v5

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->b()J

    move-result-wide v1

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "TDGAAccount.setMissionStart() called. missionId="

    aput-object v4, v3, v5

    aput-object p1, v3, v6

    const/4 v4, 0x2

    const-string v5, "   gameduration="

    aput-object v5, v3, v4

    const/4 v4, 0x3

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v3}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    iget-object v3, p0, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    iget-object v4, p0, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    invoke-static {v0, v3, v4}, Lcom/tendcloud/tenddata/TDGAAccount;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mission_duration_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method final b()J
    .locals 4

    iget-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->j:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    add-long/2addr v0, v2

    iget-wide v2, p0, Lcom/tendcloud/tenddata/TDGAAccount;->k:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method final b(Ljava/lang/String;)J
    .locals 7

    const-wide/16 v0, 0x0

    const/4 v6, 0x1

    const/4 v5, 0x0

    new-array v2, v6, [Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "TDGAAccount.getMissionDuration() called. missionId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->a()Landroid/content/Context;

    move-result-object v2

    if-nez v2, :cond_0

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "TalkingDataGA.getContext() == null."

    aput-object v3, v2, v5

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->b()J

    move-result-wide v3

    iget-object v5, p0, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    iget-object v6, p0, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    invoke-static {v2, v5, v6}, Lcom/tendcloud/tenddata/TDGAAccount;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mission_duration_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    sub-long v0, v3, v0

    goto :goto_0
.end method

.method final c()V
    .locals 2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->k:J

    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    :goto_0
    return-object p0

    :catch_0
    move-exception v0

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Cloning not allowed."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final getAccountId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->b:Ljava/lang/String;

    return-object v0
.end method

.method public final getAccountName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->d:Ljava/lang/String;

    return-object v0
.end method

.method public final getAccountType()Lcom/tendcloud/tenddata/TDGAAccount$AccountType;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->c:Lcom/tendcloud/tenddata/TDGAAccount$AccountType;

    return-object v0
.end method

.method public final getAge()I
    .locals 1

    iget v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->g:I

    return v0
.end method

.method public final getGameServer()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    return-object v0
.end method

.method public final getGender()Lcom/tendcloud/tenddata/TDGAAccount$Gender;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->f:Lcom/tendcloud/tenddata/TDGAAccount$Gender;

    return-object v0
.end method

.method public final getLevel()I
    .locals 1

    iget v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->e:I

    return v0
.end method

.method public final setAccountName(Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TDGAAccount.setAccountName Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->d:Ljava/lang/String;

    invoke-direct {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->e()V

    return-void
.end method

.method public final setAccountType(Lcom/tendcloud/tenddata/TDGAAccount$AccountType;)V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TDGAAccount.setAccountType Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->c:Lcom/tendcloud/tenddata/TDGAAccount$AccountType;

    invoke-direct {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->e()V

    return-void
.end method

.method public final setAge(I)V
    .locals 3

    iget v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->g:I

    if-ne v0, p1, :cond_0

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TDGAAccount.setAge Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    iput p1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->g:I

    invoke-direct {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->e()V

    goto :goto_0
.end method

.method public final setGameServer(Ljava/lang/String;)V
    .locals 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TDGAAccount.setGameServer Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->h:Ljava/lang/String;

    invoke-direct {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->f()V

    :cond_0
    return-void
.end method

.method public final setGender(Lcom/tendcloud/tenddata/TDGAAccount$Gender;)V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TDGAAccount.setGender Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->f:Lcom/tendcloud/tenddata/TDGAAccount$Gender;

    invoke-direct {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->e()V

    return-void
.end method

.method public final setLevel(I)V
    .locals 8

    iget v0, p0, Lcom/tendcloud/tenddata/TDGAAccount;->e:I

    if-ne v0, p1, :cond_0

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TDGAAccount.setLevel Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    iget v4, p0, Lcom/tendcloud/tenddata/TDGAAccount;->e:I

    iput p1, p0, Lcom/tendcloud/tenddata/TDGAAccount;->e:I

    invoke-direct {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->d()J

    move-result-wide v5

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/tendcloud/tenddata/TDGAAccount;->a(Landroid/content/Context;Lcom/tendcloud/tenddata/TDGAAccount;)V

    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v7

    new-instance v0, Lcom/tendcloud/tenddata/game/x;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v3, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/tendcloud/tenddata/game/x;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;IJ)V

    const/16 v1, 0xf

    invoke-static {v7, v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
