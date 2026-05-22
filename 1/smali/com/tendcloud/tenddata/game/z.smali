.class public Lcom/tendcloud/tenddata/game/z;
.super Lcom/tendcloud/tenddata/game/aq;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1

    const-string v0, "G8"

    invoke-direct {p0, v0}, Lcom/tendcloud/tenddata/game/aq;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/z;->a:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getAccountId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/z;->b:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getLevel()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/z;->c:I

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getGameServer()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/z;->d:Ljava/lang/String;

    iput-object p3, p0, Lcom/tendcloud/tenddata/game/z;->f:Ljava/lang/String;

    iput-object p4, p0, Lcom/tendcloud/tenddata/game/z;->g:Ljava/util/Map;

    iget-object v0, p0, Lcom/tendcloud/tenddata/game/z;->g:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/z;->g:Ljava/util/Map;

    :cond_0
    return-void
.end method


# virtual methods
.method protected a()V
    .locals 0

    return-void
.end method

.method protected a_()Lorg/json/JSONObject;
    .locals 4

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "gameSessionID"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/z;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "userID"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/z;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "level"

    iget v2, p0, Lcom/tendcloud/tenddata/game/z;->c:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "gameServer"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/z;->d:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "actionID"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/z;->f:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "actionData"

    new-instance v2, Lorg/json/JSONObject;

    iget-object v3, p0, Lcom/tendcloud/tenddata/game/z;->g:Ljava/util/Map;

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method
