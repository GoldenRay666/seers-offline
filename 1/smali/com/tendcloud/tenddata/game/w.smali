.class final Lcom/tendcloud/tenddata/game/w;
.super Ljava/lang/Object;


# instance fields
.field a:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0}, Lcom/tendcloud/tenddata/game/w;->b()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0}, Lcom/tendcloud/tenddata/game/w;->b()V

    iget-object v0, p0, Lcom/tendcloud/tenddata/game/w;->a:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private b()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/w;->a:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/tenddata/game/w;->a:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public a()Ljava/lang/String;
    .locals 2

    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/tendcloud/tenddata/game/w;->a:Ljava/util/Map;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
