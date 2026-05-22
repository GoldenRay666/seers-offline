.class public Lcom/taomee/seer2/a/c/d;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/taomee/seer2/a/c/b;


# instance fields
.field public a:I

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/taomee/seer2/a/c/d;->a:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/a/c/d;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/taomee/seer2/a/d/b;->e:Ljava/lang/String;

    return-object v0
.end method

.method public a(Lorg/json/JSONObject;)Z
    .locals 1

    :try_start_0
    sget-object v0, Lcom/taomee/seer2/a/d/b;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    :goto_0
    iput v0, p0, Lcom/taomee/seer2/a/c/d;->a:I

    sget-object v0, Lcom/taomee/seer2/a/d/b;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_1
    iput-object v0, p0, Lcom/taomee/seer2/a/c/d;->b:Ljava/lang/String;

    const/4 v0, 0x1

    :goto_2
    return v0

    :cond_0
    sget-object v0, Lcom/taomee/seer2/a/d/b;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/taomee/seer2/a/d/b;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_2
.end method
