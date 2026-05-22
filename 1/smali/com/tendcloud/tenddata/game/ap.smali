.class public Lcom/tendcloud/tenddata/game/ap;
.super Lcom/tendcloud/tenddata/game/aq;

# interfaces
.implements Lcom/tendcloud/tenddata/game/af;


# static fields
.field public static final a:Ljava/lang/String; = "repeat"

.field private static final f:Ljava/lang/String; = "appVersionCode"

.field private static final g:Ljava/lang/String; = "exceptionData"

.field private static final h:Ljava/lang/String; = "shortHashCode"


# instance fields
.field public b:I

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field private i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "G13"

    invoke-direct {p0, v0}, Lcom/tendcloud/tenddata/game/aq;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput v0, p0, Lcom/tendcloud/tenddata/game/ap;->b:I

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/ap;->c:Ljava/lang/String;

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/ap;->i:Ljava/lang/String;

    iput-object p2, p0, Lcom/tendcloud/tenddata/game/ap;->d:Ljava/lang/String;

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v0, "\r\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lcom/tendcloud/tenddata/game/y;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/y;->a([B)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    aget-object v2, v0, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x2

    aget-object v0, v0, v2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static a(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 6

    const/16 v0, 0x32

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\r\n"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    array-length v1, v3

    if-le v1, v0, :cond_0

    :goto_0
    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\t"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v3, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_0
    array-length v0, v3

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    invoke-static {v2, v3, v0, v1}, Lcom/tendcloud/tenddata/game/ap;->a(Ljava/lang/StringBuilder;[Ljava/lang/StackTraceElement;Ljava/lang/Throwable;I)V

    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static a(Ljava/lang/StringBuilder;[Ljava/lang/StackTraceElement;Ljava/lang/Throwable;I)V
    .locals 7

    const/16 v0, 0x32

    invoke-virtual {p2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    array-length v1, v4

    add-int/lit8 v2, v1, -0x1

    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    move v6, v1

    move v1, v2

    move v2, v6

    :goto_0
    if-ltz v1, :cond_0

    if-ltz v2, :cond_0

    aget-object v3, v4, v1

    aget-object v5, p1, v2

    invoke-virtual {v3, v5}, Ljava/lang/StackTraceElement;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v3, v1, -0x1

    add-int/lit8 v1, v2, -0x1

    move v2, v1

    move v1, v3

    goto :goto_0

    :cond_0
    if-le v1, v0, :cond_1

    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Caused by : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :goto_2
    if-gt v1, v0, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, v4, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1
    move v0, v1

    goto :goto_1

    :cond_2
    const/4 v0, 0x5

    if-lt p3, v0, :cond_4

    :cond_3
    :goto_3
    return-void

    :cond_4
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_3

    add-int/lit8 v0, p3, 0x1

    invoke-static {p0, v4, p2, v0}, Lcom/tendcloud/tenddata/game/ap;->a(Ljava/lang/StringBuilder;[Ljava/lang/StackTraceElement;Ljava/lang/Throwable;I)V

    goto :goto_3
.end method


# virtual methods
.method protected a()V
    .locals 3

    const-string v0, "repeat"

    iget v1, p0, Lcom/tendcloud/tenddata/game/ap;->b:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/tendcloud/tenddata/game/ap;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "appVersionCode"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "exceptionData"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/ap;->d:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "shortHashCode"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/ap;->i:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    return-void
.end method

.method public b()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/tenddata/game/ap;->i:Ljava/lang/String;

    return-object v0
.end method

.method public c()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
